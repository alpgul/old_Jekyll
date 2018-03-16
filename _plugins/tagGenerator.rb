module Jekyll

  class TagIndex < Page
    def initialize(site, name, dir, tag, pagination)
    # def initialize(site, base, dir, tag, relatedtags)
      @site = site
      @base = site.source
      @dir = dir
      @name = name

      self.process(@name)
      self.read_yaml(File.join(@base, '_layouts'), 'tag.html')
      self.data['tag'] = tag
      self.data['title'] = "Posts&nbsp;Tag&nbsp;:&nbsp;"+tag.capitalize+""
        self.data['pagination'] = pagination
      # self.data['relatedtags'] = relatedtags
    end
  end

  class TagsIndex < Page
    def initialize(site,  dir, tags)
    # def initialize(site, base, dir, tags)
      @site = site
      @base = site.source
      @dir = dir
      @name = 'index.html'

      self.process(@name)
      self.read_yaml(File.join(@base, '_layouts'), 'tags.html')
      self.data['tags'] = tags
    end
  end

  class TagGenerator < Generator
    safe true

    def generate(site)
      if site.layouts.key? 'tag'
        dir = 'tag'
        tags=[]
        site.tags.keys.each do |tag, posts|
            tags.push(tag)
          write_tag_index(site, File.join(dir, tag), tag, site.tags[tag])
        end
      end
      write_tags_index(site, dir,tags)
    end 
    def createpagination(site,tag,posts)
             size=site.config['paginate'].to_f
              total = calculate_pages(posts, size)
              dirs=[]
              (1..total).each do |i|
                name=i.to_s+'.html'
                dir="/"+File.join('tag', tag)
                dirs.push(dir+"/"+i.to_s)
                pagination = {
                "nums" => [*1..total.ceil],
                "posts" => posts.slice((i-1)*size,size),
                "paths" => dirs,
                "paginate_num" => total.ceil,
                "paginate_path" => "/"+dir+"/".gsub("//","/"),
                "total_post" => posts.size,
                "current_num" => i,
                "prev_path" => ((i-1)!=0)? (dir +"/"+ (i-1).to_s):nil,
                "next_path" => ((i+1)<=total.ceil)? (dir+"/" + (i+1).to_s):nil,
                "prev_num" => ((i-1)!=0)? i-1:nil,
                "next_num" => ((i+1)<=total.ceil)? i+1:nil,
              }
                if(i==1)
                  site.pages << TagIndex.new(site, 'index.html', File.join('tag', tag), tag, pagination)
      
                end
                site.pages << TagIndex.new(site, name, File.join('tag', tag), tag, pagination)
                 end
            
        end
    def calculate_pages(all_posts,per_page)
     return (all_posts.size.to_f / per_page.to_i).ceil
    end

    def write_tags_index(site, dir, tags)
      # tags = write_tagslist(site)
      # index = TagsIndex.new(site, site.source, dir, tags)
      name="index.html"
      index = TagsIndex.new(site,  dir, tags )
      index.render(site.layouts, site.site_payload)
      index.write(site.dest)
      site.pages << index
    end

    def write_tag_index(site, dir, tag, posts)
      # relatedtags = write_relatedtags(site, tag)
      # index = TagIndex.new(site, site.source, dir, tag, relatedtags)
      createpagination(site,tag,posts)
    end

    # def write_tagslist(site)
    #   tags = Array.new
    #   site.posts.each do |post|
    #     post.tags.each do |ltag|
    #       tags.push(ltag)
    #     end
    #   end
    #   return tags.uniq
    # end

    # def write_relatedtags(site, tag)
    #   relatedtags = Array.new
    #   site.posts.each do |post|
    #     if post.tags.include?(tag)
    #       post.tags.each do |ltag|
    #         relatedtags.push(ltag)
    #       end
    #     end
    #   end
    #   return relatedtags.uniq
    # end

  end

end