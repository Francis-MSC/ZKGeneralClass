
Pod::Spec.new do |s|


  s.name         = "ZKGeneral"
  s.version      = "0.0.2"
  s.summary      = "Category,MSC,ZK"
  s.description  = <<-DESC
                   ios common/genetal category
                   DESC

  s.homepage     = "https://github.com/Francis-MSC/ZKGeneralClass"

  s.license      = "MIT"

  s.author             = { "msc" => "zk_msc@163.com" }

  s.platform     = :ios

  s.source       = { :git => "https://github.com/Francis-MSC/ZKGeneralClass.git", :tag => 
"#{s.version}" }

  s.subspec 'Commons' do |com|
   #com.version  =  '0.0.2'
   #com.source_files = 'GeneralClass/Commons/**/*.{h,m}'
   #Commons.public_header_files = 'GeneralClass/Commons/**/*.h'

   com.subspec 'MyUtil' do |u|
    #u.version   =   '0.0.1'
    u.source_files = 'GeneralClass/Commons/MyUtil/*.{h,m}'
   end

   com.subspec 'Singleton' do |sig|
    #sig.version =   '0.0.1'
    sig.source_files = 'GeneralClass/Commons/Singleton/*.{h,m}'
   end

  end


  s.subspec 'Category' do |cat|
   #cat.version  =  '0.0.1'
   #cat.source_files = "GeneralClass/Category/**/*"
   #cat.public_header_files = 'GeneralClass/Category/**/*.h'

   cat.subspec 'AttributedString+Mutable' do |att|
    #att.version =   '0.0.2'
    att.source_files = 'GeneralClass/Category/AttributedString+Mutable/*.{h,m}'
   end

   cat.subspec 'UIAlert+Block' do |alert|
    #alert.version =   '0.0.3'
    alert.source_files = 'GeneralClass/Category/UIAlert+Block/*.{h,m}'
   end

   cat.subspec 'UIView+Frame' do |vframe|
    #vframe.version =   '0.0.1'
    vframe.source_files = 'GeneralClass/Category/UIView+Frame/*.{h,m}'
   end

  end

#s.source_files  = "GeneralClass/Commons/**/*.h"



end
