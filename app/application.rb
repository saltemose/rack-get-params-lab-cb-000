class Application

  @@items = ["Apples","Carrots","Pears"]
  @@cart = @@items

  def call(env)
    resp = Rack::Response.new
    req = Rack::Request.new(env)

    if req.path.match(/items/)
      @@items.each do |item|
        resp.write "#{item}\n"
      end
    elsif req.path.match(/cart/)
        if (@@cart != [])
          @@cart.each do |item|
          resp.write "#{item}\n"
        end
      else resp.write "Your cart is empty"
    elsif req.path.match(/add/)

    elsif req.path.match(/search/)
      search_term = req.params["q"]
      resp.write handle_search(search_term)
    else
      resp.write "Path Not Found"
    end

    resp.finish
  end



  def handle_search(search_term)
    if @@items.include?(search_term)
      return "#{search_term} is one of our items"
    else
      return "Couldn't find #{search_term}"
    end
  end


end
