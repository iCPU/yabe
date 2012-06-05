module ApplicationHelper

def full_title(page_title)
    base_title = "iCPU WIP"
    if page_title.empty?
      base_title
    else
      "#{base_title} | #{page_title}"
    end
  end

  def display_segment( node )
    
    html = "<li class =\"closed\">"
    node_class = node.children.length == 0 ? "file" : "folder"
    html << "<span class=\"#{node_class}\">#{h(node.ebay_cat_name)} </span>"
    html << "<ul id=\"children_of_#{h(node.ebay_cat_id)}\">"
    node.children.each{|child_node|
      
      html << display_segment( child_node )
    }
    html << "</ul></li>"
  end

end
