require 'mechanize'

def scraping_image(link)
  agent = Mechanize.new
  page = agent.get(link)
  # 画像のリンクを取得
  image_url = page.at('.entry-content img').get_attribute('src')
  return image_url
end

links = [] #個別ページのリンクを保存する配列
agent = Mechanize.new
current_page = agent.get("http://review-movie.herokuapp.com/")

# 個別ページのリンクを取得する
elements = current_page.search('.entry-title a')
elements.each do |ele|
  links << ele.get_attribute('href')
end

links.each do |link|
  puts scraping_image('http://review-movie.herokuapp.com/' + link)
end