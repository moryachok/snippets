/**
 * example of function defined on ruby
 * @type string
 */
def get_search_url(engine_id)
  case engine_id
  when "google" then "http://www.google.com"
  when "yahoo" then "http://www.yahoo.com"
  else "http://www.yandex.ru"
    end
end
