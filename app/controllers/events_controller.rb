class EventsController < ApplicationController
  def index
  	@event = Event.all
  end

  def new
  	
  end

  def show
    @event = Event.find(params[:id])
   @nb_visitors = Attendance.where(event_id: params[:id]).count
   @date_debut = @event.start_date.strftime("%A %d %B %Y")  
   @date_debut_time = @event.start_date.to_formatted_s(:time)

   @end_date = @event.start_date + @event.duration*60
   @date_fin = @end_date.strftime("%A %d %B %Y")  
   @date_fin_time = @end_date.to_formatted_s(:time)

   end

  def create

  	@event = Event.create(start_date: params[:start_date], duration: params[:duration], title: params[:title], description: params[:description], price: params[:price], location: params[:location], admin_id: current_user.id )
  	redirect_to root_path
  end

  def subscribe 
      event = Event.find(params[:id])
      
        # Amount in cents
      @amount = event.price

      customer = Stripe::Customer.create({
        email: params[:stripeEmail],
        source: params[:stripeToken],
      })

      charge = Stripe::Charge.create({
        customer: customer.id,
        amount: @amount,
        description: 'Rails Stripe customer',
        currency: 'eur',
      })

       @attendance = Attendance.create(stripe_customer_id: "eeee", event: event, user: current_user)
        flash[:success]= "Vous inscprition a bien été prise en compte, welcome !"
        redirect_to event_path(event.id)

    rescue Stripe::CardError => e
      flash[:error] = e.message
      redirect_to new_charge_path
    
  end

end
