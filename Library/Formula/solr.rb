require "formula"

class Solr < Formula
  homepage "http://lucene.apache.org/solr/"
  url "http://www.apache.org/dyn/closer.cgi?path=lucene/solr/5.0.0/solr-5.0.0.tgz"
  sha1 "0c14a5212c4b9d9491881d743390596a19a3e989"

  skip_clean 'example/logs'

  def install
    libexec.install Dir["*"]
    bin.install "#{libexec}/bin/solr"
    share.install "#{libexec}/bin/solr.in.sh"
    prefix.install "#{libexec}/example"
    prefix.install "#{libexec}/server"
  end

  plist_options :manual => "solr start"

  def plist; <<-EOS.undent
      <?xml version="1.0" encoding="UTF-8"?>
      <!DOCTYPE plist PUBLIC "-//Apple Computer//DTD PLIST 1.0//EN" "http://www.apple.com/DTDs/PropertyList-1.0.dtd">
      <plist version="1.0">
      <dict>
          <key>Label</key>
          <string>#{plist_name}</string>
          <key>ProgramArguments</key>
          <array>
            <string>#{opt_bin}/solr</string>
            <string>start</string>
            <string>-f</string>
          </array>
          <key>ServiceDescription</key>
          <string>#{name}</string>
          <key>WorkingDirectory</key>
          <string>#{HOMEBREW_PREFIX}</string>
          <key>RunAtLoad</key>
          <true/>
      </dict>
      </plist>
    EOS
  end
end
