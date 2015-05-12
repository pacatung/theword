module ContactsHelper

  def options_for_receiver(user)
    r=[]
    user.contacts.each do |c|
      r << c if c.receivers.first
    end

    {
      "從現有收訊人選擇" => r.map{|c|[c.name,c.id]}
      "從聯絡人選擇" => user.contacts.all.map{ |c| [c.name, c.id] },
    }
  end

end
