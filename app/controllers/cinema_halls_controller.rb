class CinemaHallsController < ApplicationController
        def index
       @cinema_halls = CinemaHall.all
    
        render json: @cinema_halls
      end
    
      def create
        @cinema_hall = Cinemahall.new(cinema_hall_params)
    
        respond_to do |format|
          if @cinema_hall.save
            format.json {render :show, status: :created, location: @cinema_hall}
          else
            format.json {render json: @cinema_hall.errors, status: :unprocessable_entity}
          end
        end
      end  
     
      def update
        if @cinema_hall.update(cinema_hall_params)
          flash[:success] = "Cinema hall has been updated"
          redirect_to @cinema_hall
        else
          flash.now[:danger] = "Cinema hall has not been updated"
          render :edit
        end
      end

      def destroy
        @cinema_hall.destroy
        redirect_to root_url, notice: 'Cinema hall has been deleted.'
      end
end
