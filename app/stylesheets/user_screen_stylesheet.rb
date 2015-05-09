class UserScreenStylesheet < ApplicationStylesheet
  def root_view(style)
    style.background_color = color.white
  end

  def name(style)
    style.frame = {
      top: 90,
      from_right: 20,
      right_of_previous: 20,
      height: 150
    }

    style.number_of_lines = 0
    style.text_alignment = :left
    style.line_break_mode = :word_wrapping
    style.font = UIFont.boldSystemFontOfSize(25.0)
  end

  def last_seen_at(style)
    user_detail_item(style)
  end

  def details_title(style)
    user_detail_item(style)
    style.text_alignment = :left
    style.font = UIFont.boldSystemFontOfSize(20.0)
    style.color = color.black
  end

  def user_detail_item(style)
    style.frame = {
      left: 20,
      from_right: 20,
      below_previous: 30,
      height: 50
    }
  end

  def avatar_image(style)
    style.frame = {
      left: 20,
      width: 150,
      below_previous: 90,
      height: 150,
    }

    style.corner_radius = 30
  end
end
