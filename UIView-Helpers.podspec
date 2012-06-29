Pod::Spec.new do |s|
  s.name         = "UIView-Helpers"
  s.version      = "1.0.0"
  s.summary      = "UIView-Helpers is a collecion of methods that make laying out UIViews easier and readable."
  s.homepage     = "https://github.com/andrewroycarter/UIView-Helpers"

  # Specify the license type. CocoaPods detects automatically the license file if it is named
  # `LICENSE*', however if the name is different, specify it.
  # Only if no dedicated file is available include the full text of the license.
  #
  s.license      = 'MIT (example)'
  # s.license      = { :type => 'MIT', :file => 'LICENSE', :text => 'Permission is hereby granted ...' }

  # Specify the authors of the library, with email addresses. You can often find
  # the email addresses of the authors by using the SCM log. E.g. $ git log
  #
  s.authors      = { "Trung Tran" => "trung.tran@willowtreeapps.com", "Andrew Roy Carter" => "andrew.carter@willowtreeapps.com" }
  #
  # If absolutely no email addresses are available, then you can use this form instead.
  #
  # s.author       = 'Trung Tran', 'other author'

  # Specify the location from where the source should be retreived.
  #
  s.source       = { :git => "https://github.com/andrewroycarter/UIView-Helpers.git", :tag => "1.0.0" }
  # s.source       = { :svn => 'http://EXAMPLE/UIView-Helpers/tags/1.0.0' }
  # s.source       = { :hg  => 'http://EXAMPLE/UIView-Helpers', :revision => '1.0.0' }

  # If this Pod runs only on iOS or OS X, then specify the platform and
  # the deployment target.
  #
  # s.platform     = :ios, '5.0'
  # s.platform     = :ios

  # ――― MULTI-PLATFORM VALUES ――――――――――――――――――――――――――――――――――――――――――――――――― #

  # If this Pod runs on both platforms, then specify the deployment
  # targets.
  #
  # s.ios.deployment_target = '5.0'
  # s.osx.deployment_target = '10.7'

  # A list of file patterns which select the source files that should be
  # added to the Pods project. If the pattern is a directory then the
  # path will automatically have '*.{h,m,mm,c,cpp}' appended.
  #
  # Alternatively, you can use the FileList class for even more control
  # over the selected files.
  # (See http://rake.rubyforge.org/classes/Rake/FileList.html.)
  #
  s.source_files = 'Classes', '*.{h,m}'

  # A list of resources included with the Pod. These are copied into the
  # target bundle with a build phase script.
  #
  # Also allows the use of the FileList class like `source_files does.
  #
  # s.resource  = "icon.png"
  # s.resources = "Resources/*.png"

  # A list of paths to preserve after installing the Pod.
  # CocoaPods cleans by default any file that is not used.
  # Also allows the use of the FileList class like `source_files does.
  #
  # s.preserve_paths = "examples", "doc"

  # Specify a list of frameworks that the application needs to link
  # against for this Pod to work.
  #
  # s.framework  = 'SomeFramework'
  # s.frameworks = 'SomeFramework', 'AnotherFramework'

  # Specify a list of libraries that the application needs to link
  # against for this Pod to work.
  #
  # s.library   = 'iconv'
  # s.libraries = 'iconv', 'xml2'

  # If this Pod uses ARC, specify it like so.
  #
  # s.requires_arc = true

  # If you need to specify any other build settings, add them to the
  # xcconfig hash.
  #
  # s.xcconfig = { 'HEADER_SEARCH_PATHS' => '$(SDKROOT)/usr/include/libxml2' }

  # Finally, specify any Pods that this Pod depends on.
  #
  # s.dependency 'JSONKit', '~> 1.4'
end
