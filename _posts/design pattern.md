---
layout: post
title:  "Design Pattern!"
date:   2018-02-21 20:58:27
categories: Design Pattern
description: Design Pattern
tags:
    - Design 
    - Pattern
images: 
    url: "https://qph.ec.quoracdn.net/main-qimg-d0ba47447f02c4bb31d86840ec36726b-c"
    alt: "Design Pattern"
---
# Factory Pattern
![factory pattern](https://www.tutorialspoint.com/design_pattern/images/factory_pattern_uml_diagram.jpg)

**Ne Zaman:**
* İstemciden nesne oluşturmalarını ayrıştırmak istersek
* Bir arayüzden oluşan alt classları ve bu sınıflar koşullara göre oluşturuyorsa
* Bu sınıfları belli koşullara gore oluşturan ve geri bildiren sınıfa factory denir.

**Faydaları:**
* Yeni bir alt sınıf ekledigimizde sadece alt sınıfı factorye eklemek yeterlidir.
* Resimde görüldüğü gibi sol kısımdaki nesneleri oluşturmakla gorevlı bır sınıf tanımlanmış bu sınıfa factory denir.
* Birden fazla sınıfın kontrolu tek noktadan gerçekleşir
* Örneklerin sayısı ve tekrar kullanabilirliği singleton veya Multiton ile kontrol edilir.

**Dezavantajları**
* Çok fazla soyutlama kodun okunabilirliğini zorlaştırır.

# Abstract Factory Pattern
![Abstract Factory Pattern](https://www.tutorialspoint.com/design_pattern/images/abstractfactory_pattern_uml_diagram.jpg)

**Ne Zaman:**
* Farklı <u>**platformlara taşınabilir**</u> olabilmesi için
* Oluşturulan fabirkanın ve o fabrikanın oluşturacağı nesneyi seçecegimizde
* Platform değişikliği en az değişiklikle yapılır.
* Resimde gorulduğu gibi abstract factoryden türetilen factory sınıfları 2 tane arayüzün sınıflarını koşullara gore oluşturmaktadır. Bu factory sınıfları abstact factoryde birleştirilierek factory producer ile istemciden ayrıştırılmış ve tek bir noktada kontrolü sağlanmaktadır.
* Yeni factıry ve arayüz eklenmek istediğimizde sadece abstact factoryde ve koşul ne ise producerda değişiklik yapılması yetecektir.

**Faydaları:**
* Arayüz üzerinden bağlandığı için yeni alt sınıf ekleme kolaydır
* Abstract factory tüm ürünlere erişebilir.
* Yeni ürün kolayca desteklenir

**Dezavantajları**
* Çok fazla soyutlama kodun karmaşıklığını arttırır.
* Bir fabrikada değişiklik olursa arabirlimin tüm fabrikalar için değiştirilmesi gerekir.

# Builder Pattern
![Builder Pattern](https://www.tutorialspoint.com/design_pattern/images/builder_pattern_uml_diagram.jpg)

**Ne Zaman:**
* Çok fazla yapıcı agumana sahip olanlar için
* Bir nesne oluşturmak için birçok işlem yapılması gerektiğinde kullanışlıdır
* Tam oluşturma mantığını kapsüllemek için

**Faydaları:**
* Nesne oluşturma süreci kontrol edilir.
* Bir nesne oluşturmak için bir çok işlem yapılmasında kullanışlıdır.
* Her argüment için oluşturlucak kombinasyondan kurtuluruz.

**Dezavantajları**
* Değiştirilebilir nesne gerekiyorsa uygun değildir.

# Singleton
![Singleton](https://www.tutorialspoint.com/design_pattern/images/singleton_pattern_uml_diagram.jpg)

**Ne Zaman:**
* Çok fazla yapıcı agumana sahip olanlar için
* Bir nesne oluşturmak için birçok işlem yapılması gerektiğinde kullanışlıdır
* Tam oluşturma mantığını kapsüllemek için

**Faydaları:**
* Nesne oluşturma süreci kontrol edilir.
* Bir nesne oluşturmak için bir çok işlem yapılmasında kullanışlıdır.
* Her argüment için oluşturlucak kombinasyondan kurtuluruz.

**Dezavantajları**
* Değiştirilebilir nesne gerekiyorsa uygun değildir