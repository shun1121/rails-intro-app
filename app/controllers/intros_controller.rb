class IntrosController < ApplicationController
  before_action :set_intro, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!
  # GET /intros
  # GET /intros.json
  def index
    @intros = Intro.all.order("id DESC").page(params[:page]).per(5) # added
  end

  # GET /intros/1
  # GET /intros/1.json
  def show
  end

  # GET /intros/new
  def new
    @intro = Intro.find_or_create_by(:user_id => current_user.id) #user_idがログインユーザーなら
    redirect_to edit_intro_url(@intro)
  end

  # GET /intros/1/edit
  def edit
    if @intro.user_id != current_user.id 
      flash[:notice] = "他のユーザーの編集はできません。"
      redirect_to intros_path
    end
  end

  # POST /intros
  # POST /intros.json
  def create
    @intro = Intro.new(intro_params)

    respond_to do |format|
      if @intro.save
        format.html { redirect_to @intro, notice: 'Intro was successfully created.' }
        format.json { render :show, status: :created, location: @intro }
      else
        format.html { render :new }
        format.json { render json: @intro.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /intros/1
  # PATCH/PUT /intros/1.json
  def update
    @intros = Intro.all
    respond_to do |format|
      if @intro.update(intro_params)
        format.html { redirect_to @intro, notice: 'Intro was successfully updated.' }
        format.json { render :show, status: :ok, location: @intro }
        json = render_to_string(template: "../views/intros/index.json.jbuilder")
        #↑はintros_controller.rbから見てindex.json.jbuilderがどこにあるか指定
        
        # print("+++++++++++")
        # print(ENV['AWS_ACCESS_KEY_ID'])
        # print("+++++++++++")
        # print(ENV['AWS_SECRET_ACCESS_KEY'])

        #↓は誰がawsのs3を使っているのか設定している。配列。本来はintros_helper.rbにかく。
        client = Aws::S3::Client.new(
          access_key_id: ENV['AWS_ACCESS_KEY_ID'],
          #access_key_id: Rails.application.credentials.aws[:access_key_id],
          secret_access_key: ENV['AWS_SECRET_ACCESS_KEY'],
          #secret_access_key: Rails.application.credentials.aws[:secret_access_key],
          region: 'ap-northeast-1'
        ) 
        #↓はbucketでバケット名、keyでタイトル名、bodyであげるファイルの中身を設定している。
        client.put_object(bucket:"introinfo", key:"data1", body:json)
      else
        format.html { render :edit }
        format.json { render json: @intro.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /intros/1
  # DELETE /intros/1.json
  def destroy
    if @intro.user_id != current_user.id
      #raise ActionController::RoutingError.new("Not authorized")
      flash[:notice] = "他のユーザーの削除はできません。"
      redirect_to intros_path#action: :index
    else
      @intro.destroy
       respond_to do |format|
         format.html { redirect_to intros_url, notice: 'Intro was successfully destroyed.' }
         format.json { head :no_content }
      end
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_intro
      @intro = Intro.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def intro_params
      params.require(:intro).permit(:name, :hometown, :content, :image)
    end
end
