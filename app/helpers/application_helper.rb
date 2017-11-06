module ApplicationHelper

  def randomized_background_image
  images = ["http://www.spring.org.uk/images/meeting.jpg",
    "https://ihg.scene7.com/is/image/ihg/Business_Meeting_480x320",
    "http://cdn.p-r-i.org/wp-content/uploads/2012/09/09120259/Meetings2.jpg",
    "http://willkempartschool.com/wp-content/uploads/2016/08/adding-shadows-to-a-landscape-painting.jpg",
    "http://i.ndtvimg.com/i/2015-12/technique-625_623x350_61449041551.jpg",
    "http://wbbh.images.worldnow.com/images/14431555_G.jpg",
    "https://www.sciencedaily.com/images/2016/05/160504085309_1_900x600.jpg",
    "http://www.marcha.org.ar/wp-content/uploads/2014/12/tic-argentina-640x300.jpg",
    "https://www.uaeadvo.com/wp-content/uploads/2014/07/Civil-Law.jpg"]
  images[rand(images.size)]
  end

  def randomized_background_image1
  images = ["https://3ggqje2jhgjp45f9yd48ay211i1-wpengine.netdna-ssl.com/wp-content/uploads/2014/08/new_p2p_dynamic.jpg",
    "http://cultureways.com/wp-content/uploads/42.jpg",
    "https://cdn.pixabay.com/photo/2015/05/26/23/52/technology-785742_960_720.jpg",
    "https://mistressphoenixjade.com/wp-content/uploads/2017/01/3.jpg",
    "https://industry.airliquide.com.au/sites/industry_au/files/styles/web_page_cover/public/2016/12/19/environment.jpg?itok=BW6BZVmF",
    "https://blogs.cdc.gov/publichealthmatters/files/2017/04/waterfall.jpg",
    "http://cdn.home-designing.com/wp-content/uploads/2013/07/modern-interior.jpg",
    "https://i.pinimg.com/originals/d5/76/59/d57659b5b1b8a5b9caf157f6f7376ee3.jpg"]
  images[rand(images.size)]
  end


end
