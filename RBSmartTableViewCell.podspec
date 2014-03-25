Pod::Spec.new do |s|
  s.name                = "RBSmartTableViewCell"
  s.version             = "0.0.1"
  s.summary             = "A UITableViewCell subclass that makes custom cell production easy."

  s.description         = <<-DESC
                          A UITableViewCell subclass that makes custom cell production easy.
                          DESC
  s.homepage            = "https://github.com/rob-brown/RBSmartTableViewCell"
  s.license             = { :type => 'MIT', :file => 'LICENSE' }
  s.author              = { "Robert Brown" => "robs.email.filter+RBSmartTableViewCell@gmail.com" }
  s.social_media_url    = "http://twitter.com/robby_brown"
  s.platform            = :ios, '4.0'
  s.source              = { :git => "https://github.com/rob-brown/RBSmartTableViewCell.git", :tag => "0.0.1" }
  s.source_files        = '*.{h,m}'
  s.public_header_files = '*.h'
  s.resources           = "*.xib"
  s.requires_arc        = true
end
