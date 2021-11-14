module FlexHelper
  def receipt_item(key, value, **options)
    horizontal_box **options do
      text key, size: "sm", color: "#555555", flex: 0
      text value, size: "sm", color: "#111111", align: "end"
    end
  end

  def shopping_price(price)
    baseline_box do
      price_parts = price.to_s.split(".")
      text "$#{price_parts[0]}", wrap: true, weight: :bold, size: :xl, flex: 0
      text ".#{price_parts[1]}", wrap: true, weight: :bold, size: :sm, flex: 0
    end
  end

  def star(n, m=5)
    baseline_box spacing: :xs do
      n.times do
        icon "https://scdn.line-apps.com/n/channel_devcenter/img/fx/review_gold_star_28.png"
      end
      (m-n).times do
        icon "https://scdn.line-apps.com/n/channel_devcenter/img/fx/review_gray_star_28.png"
      end
      text "#{n}.0", color: "#a9a9a9"
    end
  end

  def star_xs(n, m=5)
    baseline_box spacing: :xs do
      n.times do
        icon "https://scdn.line-apps.com/n/channel_devcenter/img/fx/review_gold_star_28.png", size: :xs
      end
      (m-n).times do
        icon "https://scdn.line-apps.com/n/channel_devcenter/img/fx/review_gray_star_28.png", size: :xs
      end
      text "#{n}.0", color: "#8c8c8c", size: :xs, margin: :md, flex: 0
    end
  end

  def star_sm(n, m=5)
    baseline_box margin: :md do
      n.times do
        icon "https://scdn.line-apps.com/n/channel_devcenter/img/fx/review_gold_star_28.png", size: :sm
      end
      (m-n).times do
        icon "https://scdn.line-apps.com/n/channel_devcenter/img/fx/review_gray_star_28.png", size: :sm
      end
      text "#{n}.0", color: "#999999", size: :sm, margin: :md, flex: 0
    end
  end

  def border(color)
    {
      borderColor: color,
      borderWidth: :light
    }
  end
  
  def blue_box(options = {})
    horizontal_box **border("#0000FF").merge(options) do
      yield if block_given?
    end
  end

  def green_box(options = {})
    horizontal_box **border("#00FF00").merge(options) do
      yield if block_given?
    end
  end


end