class UserMailer < ApplicationMailer
	default from: 'no-reply@monsite.fr'
 
  def welcome_email(user)
    #on récupère l'instance user pour ensuite pouvoir la passer à la view en @user
    @user = user 

    #on définit une variable @url qu'on utilisera dans la view d’e-mail
    @url  = 'https://lit-earth-88385.herokuapp.com/' 

    # c'est cet appel à mail() qui permet d'envoyer l’e-mail en définissant destinataire et sujet.
    mail(to: @user.email, subject: 'Bienvenue chez nous !') 
  end

  def new_participant_email(attendance)
    #on récupère l'instance user pour ensuite pouvoir la passer à la view en @user
    @admin = attendance.event.admin 
    @participant = attendance.participant
    @event = attendance.event

    # c'est cet appel à mail() qui permet d'envoyer l’e-mail en définissant destinataire et sujet.
    mail(to: @admin.email, subject: "#{@participant.first_name} a rejoint votre évenement #{@event.title} !") 
  end
end
