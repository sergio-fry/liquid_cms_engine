require_dependency "liquid_cms/application_controller"

module LiquidCms
  class TextBlocksController < ApplicationController
    # GET /text_blocks
    # GET /text_blocks.json
    def index
      @text_blocks = TextBlock.all
  
      respond_to do |format|
        format.html # index.html.erb
        format.json { render json: @text_blocks }
      end
    end
  
    # GET /text_blocks/1
    # GET /text_blocks/1.json
    def show
      @text_block = TextBlock.find(params[:id])
  
      respond_to do |format|
        format.html # show.html.erb
        format.json { render json: @text_block }
      end
    end
  
    # GET /text_blocks/new
    # GET /text_blocks/new.json
    def new
      @text_block = TextBlock.new
  
      respond_to do |format|
        format.html # new.html.erb
        format.json { render json: @text_block }
      end
    end
  
    # GET /text_blocks/1/edit
    def edit
      @text_block = TextBlock.find(params[:id])
    end
  
    # POST /text_blocks
    # POST /text_blocks.json
    def create
      @text_block = TextBlock.new(params[:text_block])
  
      respond_to do |format|
        if @text_block.save
          format.html { redirect_to @text_block, notice: 'Text block was successfully created.' }
          format.json { render json: @text_block, status: :created, location: @text_block }
        else
          format.html { render action: "new" }
          format.json { render json: @text_block.errors, status: :unprocessable_entity }
        end
      end
    end
  
    # PUT /text_blocks/1
    # PUT /text_blocks/1.json
    def update
      @text_block = TextBlock.find(params[:id])
  
      respond_to do |format|
        if @text_block.update_attributes(params[:text_block])
          format.html { redirect_to @text_block, notice: 'Text block was successfully updated.' }
          format.json { head :no_content }
        else
          format.html { render action: "edit" }
          format.json { render json: @text_block.errors, status: :unprocessable_entity }
        end
      end
    end
  
    # DELETE /text_blocks/1
    # DELETE /text_blocks/1.json
    def destroy
      @text_block = TextBlock.find(params[:id])
      @text_block.destroy
  
      respond_to do |format|
        format.html { redirect_to text_blocks_url }
        format.json { head :no_content }
      end
    end
  end
end
