class ProfileChannel < ApplicationCable::Channel
  def subscribed
    stream_from "profile_channel"
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end

  def image_change(data)
    current_user.update!(name: "aa")

  end

  def change(data)
    user = current_user;
    case data["type"]
    when "name" then
      user.update!(name: data["text"]);
    when "country" then
      user.update!(country: data["text"]);
    when "email" then
      user.update!(email: data["text"]);
    when "age" then
      user.update!(age: data["text"]);
    when "gender" then
      user.update!(gender: data["text"]);
    when "fullName" then
      user.update!(fullName: data["text"]);
    when "user_profile" then
      user.update!(profile: data["text"]);
    when "input-group" then
      if user.update!(image: data["text"])
        user.update!(name: "success");
      else
        user.update!(name: "failed");
      end
    end
  end
end
