class XmlDocument
  attr_accessor:indent_XML

  def initialize(indent_XML =  false)
  @indent_XML = indent_XML
  end

  def hello(options = ":name => 'dolly'")
  attr = options[:name]
  
  if block_given?
    if @indent_XML == true
      "<hello>\n" +  yield + "</hello>\n"
    else
      "<hello>" +  yield + "</hello>"
    end
  else
    if attr == nil
      xml_out = "<hello/>"
     else
       if @indent_XML == true
         xml_out = "<hello name='" + attr + "'/>\n"
       else
         xml_out = "<hello name='" + attr + "'/>"
      end
     end
    xml_out
   end

  end

  def send(tag_name)
    "<" + tag_name + "/>"
  end

  def goodbye
    if block_given?
      if @indent_XML == true
        "  <goodbye>\n" + yield + "  </goodbye>\n"
      else
        "<goodbye>" + yield + "</goodbye>"
      end
    else
      if @indent_XML == true
        "  <goodbye/>\n  "
      else
        "<goodbye/>"
      end
    end
  end

  def come_back
    if block_given?
        yield
      else
        "<come_back></come_back>"
      end
  end

  def ok_fine(options = ":be => 'that_way'")
  attr = options[:be]
     if attr == nil
      if @indent_XML == true
        "    <come_back>\n</come_back>\n    "
      else
        "<come_back></come_back>"
      end
     else
       if @indent_XML == true
         "    <come_back>\n      <ok_fine be='" + attr + "'/>\n    </come_back>\n"
       else
         "<come_back><ok_fine be='" + attr + "'/></come_back>"
       end
     end
  end
end
