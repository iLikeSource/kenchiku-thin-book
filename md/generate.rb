# encoding: Windows-31J


def convert( path )
    content = nil
    File.open( path ) do |io|
        content = io.read
    end
    dst_path = "./html/" + File::basename( path, "md" ) + "html"
    system( "pandoc #{path} -c ../../css/markdown.css" + ' -o "' + dst_path + '"' )
    File.open( dst_path ) do |io|
        content = io.read
    end
    File.open( dst_path, 'w' ) do |io|
        io.write( "<head><meta charset='utf-8'></head><body>" + content + "</body>" )
    end
end

Dir.glob( "**/*.md" ) do |path|
    p path
    convert( path )    
end

