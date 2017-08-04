class GroupsController < ApplicationController
  before_action :set_group, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!
  # GET /groups
  # GET /groups.json
  def index
    @groups = Group.all
  end

  # GET /groups/1
  # GET /groups/1.json
  def show
  end

  # GET /groups/new
  def new
    @group = Group.new
  end

  # GET /groups/1/edit
  def edit
  end

  # POST /groups
  # POST /groups.json
  def create
    @group = Group.new(group_params)

    respond_to do |format|
      member_number =@group.member.split('x').count
      sort_number_arr = [*1..member_number]
      random_sort_str = sort_number_arr.shuffle.join('x')
        

      @group.sort = random_sort_str
      if @group.save
       # format.html { redirect_to @group, notice: 'Group was successfully created.' }
        format.html { redirect_to groups_path, notice: 'Group was successfully created.' }
        format.json { render :show, status: :created, location: @group }
      else
        format.html { render :new }
        format.json { render json: @group.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /groups/1
  # PATCH/PUT /groups/1.json
  def update
    respond_to do |format|
  #____________________________________    
    member_arr = @group.member.split('x')
    sort_arr = @group.sort.split('x')
    new_member=[]
    i=0
    member_arr.count.times do
    
      new_member[i] = member_arr[sort_arr[i].to_i - 1] 
      i += 1 
    end
    @group.sort = sort_arr.shuffle.join('x')   
    @group.member_r = new_member.join('x')
  #_______________________________________
      if @group.update(group_params)
        format.html { redirect_to @group, notice: 'Group was successfully updated.' }
        format.json { render :show, status: :ok, location: @group }
      else
        format.html { render :edit }
        format.json { render json: @group.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /groups/1
  # DELETE /groups/1.json
  def destroy
    @group.destroy
    respond_to do |format|
      format.html { redirect_to groups_url, notice: 'Group was successfully destroyed.' }
      format.json { head :no_content }
    end
  end
 

  def random
    @group = Group.find(params[:id])
#__________________________________________
    member_arr = @group.member.split('x')
    sort_arr = @group.sort.split('x')
    new_member=[]
    i=0
    member_arr.count.times do

      new_member[i] = member_arr[sort_arr[i].to_i - 1]
      i += 1
    end
    @group.sort = sort_arr.shuffle.join('x')
    @group.member_r = new_member.join('x')
    puts @group.sort
    puts @group.member_r

#_____________________________________________
    a = Group.find(params[:id])
    a.update(:sort => sort_arr.shuffle.join('x'), :member_r => new_member.join('x'))
     #@group.created_at(:sort => sort_arr.shuffle.join('x'), :member_r => new_member.join('x'))
    #@group.update(group_params)
   # @group.update(:sort => sort_arr.shuffle.join('x'), :member_r => new_member.join('x'))
   # Group.where("id == #{params[:id]}").find_each do |group|
    redirect_to "/groups##{params[:id]}"
    #end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_group
      @group = Group.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def group_params
      params.require(:group).permit(:info, :member)
    end
end
