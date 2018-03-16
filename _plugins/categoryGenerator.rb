module Jekyll
  class CategoryPage < Page
    def initialize(site, category, name, pagination)
      @site = site
      @base = site.source
      dir = site.config['category_dir'] || 'categories'
      @dir = File.join(dir, category)
      @name = name

      self.process(@name)
      self.read_yaml(File.join(@base, '_layouts'), 'category_index.html')
      self.data['category'] = category

      category_title_prefix = site.config['category_title_prefix'] || 'Category: '
      self.data['title'] = "#{category_title_prefix}#{category}"
       self.data['pagination'] = pagination

    end
  end

  class CategoryPageGenerator < Generator
    safe true

    def generate(site)
      if site.layouts.key? 'category_index'
        site.categories.each do |category, posts|
           createpagination(site,category,posts)
        end
      end
    end
    def createpagination(site,category,posts)
             size=site.config['paginate'].to_f
              total = calculate_pages(posts, size)
              dirs=[]
              (1..total).each do |i|
                name=i.to_s+'.html'
                dir="/"+File.join(site.config['category_dir'] || 'categories', category)
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
                  site.pages << CategoryPage.new(site, category,'index.html',pagination)
      
                end
                site.pages << CategoryPage.new(site, category, name, pagination)
                 end
            
        end
    def calculate_pages(all_posts,per_page)
     return (all_posts.size.to_f / per_page.to_i).ceil
    end
  end
end