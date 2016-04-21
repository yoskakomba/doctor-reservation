module ApplicationHelper
    
    def gravatar_for(patient, options = { size: 80 })
        gravatar_id = Digest::MD5::hexdigest(patient.email.downcase)
        size = options[:size]
        gravatar_url = "https://secure.gravatar.com/avatar/#{gravatar_id}?s=#{size}"
        image_tag(gravatar_url, alt: patient.name, class: "gravatar")
    end
end
