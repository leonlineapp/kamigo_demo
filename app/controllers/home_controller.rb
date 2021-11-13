class HomeController < ApplicationController
  include Kamigo::Clients::LineClient

  def share_bot
  end

  def share_bot_flex
  end

  def send_test_messages
  end

  def member_join
    @profiles = params.dig(:payload, :joined, :members).map{|member| get_profile(member.dig(:userId)) }
  end

  def profile
  end

  def test
  end

  def dice
    array = [1, 2, 3, 4, 5, 6]
    @dice_result = array.sample
  end






  private

  def get_profile(user_id)
    case params[:source_type]
    when 'group'
      response = client.get_group_member_profile(
        params[:source_group_id],
        user_id
      )
    when 'room'
      response = client.get_room_member_profile(
        params[:source_group_id],
        user_id
      )
    else
      response = client.get_profile(user_id)
    end
    JSON.parse(response.body)
  end
end

