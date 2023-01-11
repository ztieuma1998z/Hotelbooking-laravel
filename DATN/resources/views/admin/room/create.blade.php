@extends('admin.layouts.main')
@section('title',trans('room.create'))
@section('content')
<div class="animated fadeIn">
  <div class="row">
    <div class="col-md-12">
      <div class="card show">
        <div class="card-header">
          <strong class="card-title">{{trans('room.create')}}</strong>
        </div>
        <div class="card-body"> 
          {{ Form::open(['route' => 'room.store', 'method' => 'post','enctype '=>'multipart/form-data', 'files' => true]) }} 
          <div class="form-group row">
            <div class="col-md-7 row">
              <div class="col-md-6 mb-1">
                {{ Form::label(trans('room.name'),'',['class' => 'font-weight-bold']) }}
                {{ Form::text('name', null, ['class' => 'form-control','placeholder'=> trans('placeholder.name'),'required' ]) }}
                <span class="text-danger">{{ $errors->first('name')}}</span>
              </div>
              <div class="col-md-6 mb-1">
                {{ Form::label(trans('room.price'),'',['class' => 'font-weight-bold']) }}
                {{ Form::number('price', null, ['class' => 'form-control','placeholder'=> trans('placeholder.price'),'required' ]) }}
                <span class="text-danger">{{ $errors->first('price')}}</span>
              </div>
              <div class="col-md-6 mb-1">
                {{ Form::label(trans('room.roomtype'),'',['class' => 'font-weight-bold']) }}
                {{Form::select('room_type_id',$roomtypes,null,['class' => " form-control",'placeholder'=>trans('room.select-roomtype'),'required'])}}
                <span class="text-danger">{{ $errors->first('room_type_id')}}</span>
              </div>
              <div class="col-md-6 mb-1">
                {{ Form::label(trans('room.status'),'',['class' => 'font-weight-bold']) }}
                {{ Form::select('status', array('0' => trans('room.display'), '1' => trans('room.non-display')),null,['class' => 'form-control','required'])}}
                <span class="text-danger">{{ $errors->first('status')}}</span>
              </div>
              
              <div class="col-md-6 mb-1">
                {{ Form::label(trans('room.service'),'',['class' => 'font-weight-bold']) }}
                {{ Form::select('services[]', $services,null,[
                'class' => 'form-control services','multiple'=>'multiple','required'])
                }}
                <span class="text-danger"> </span>
              </div>
              <div class="col-md-6 mb-1">
                {{ Form::label(trans('room.location'),'',['class' => 'font-weight-bold']) }}
                {{ Form::select('location', array('1st floor' => trans('room.1st'), '2st floor' => trans('room.2st'),'3st floor'=>trans('room.3st')),null,['class' => 'form-control','required'])}}
                <span class="text-danger">{{ $errors->first('location')}}</span>
              </div>
              <div class="col-md-4 mb-1">
                {{ Form::label(trans('room.adult'),'',['class' => 'font-weight-bold']) }}
                {{ Form::select('adult', array('1' => '1', '2' => '2','3' =>'3','4' =>'4','5' =>'5'),null,['class' => 'form-control','required'])}}
                <span class="text-danger">{{ $errors->first('adult')}}</span>
              </div>
              <div class="col-md-4 mb-1">
                {{ Form::label(trans('room.kid'),'',['class' => 'font-weight-bold']) }}
                {{ Form::select('kid', array('0' => '0', '1' => '1','2' =>'2'),null,['class' => 'form-control','required'])}}
                <span class="text-danger">{{ $errors->first('kid')}}</span>
              </div>
              <div class="col-md-4 mb-1">
                {{ Form::label(trans('room.acreage'),'',['class' => 'font-weight-bold']) }}
                {{ Form::number('acreage', null, ['class' => 'form-control','placeholder'=> trans('placeholder.acreage'),'required' ]) }}
                <span class="text-danger">{{ $errors->first('acreage')}}</span>
              </div>
              <div class="col-md-12">
                {{ Form::label(trans('room.tag'),'',['class' => 'font-weight-bold']) }}
                {{ Form::select('tags[]', $tags,null,[
                'class' => 'form-control roles','multiple'=>'multiple','id'=>'roles','required'])
              }}
              <span class="text-danger">{{ $errors->first('tags')}} </span>
            </div>
            <div class="col-md-12 mb-1">
              {{ Form::label(trans('room.description'),'',['class' => 'font-weight-bold']) }}
              {{ Form::textarea('description', null, ['class' => 'form-control','rows'=>'4','placeholder'=> trans('placeholder.description'),'required'  ]) }}
              <span class="text-danger">{{ $errors->first('description')}} </span>
            </div>
          </div>
          <div class="col-md-5 row ml-1">
            <div class="row form-group">
              <div class="col-12">
                <label for="image" class=" form-control-label font-weight-bold">{{trans('room.image')}}<span class="text text-danger"></span></label><br/>
                <small class="text text-primary">{{trans('room.main-image')}}</small>
              </div>
              <div class="col-12">
                <img class="mt-2 mb-2 img-thumbnail" id="preview_avatar" src="administration/images/default_image.png" alt="Photo avatar" style="height: 250px;">
                <input type="file" id="image" name="image" class="form-control-file" required value="{{old('image')}}">
                <span class="text-danger">{{ $errors->first('image')}} </span>
              </div>
            </div>
            <div class="row form-group">
              <div class="col-12">
                <label for="image" class=" form-control-label font-weight-bold">{{trans('room.imagedetail')}}<span class="text text-danger"></span></label><br/>
                <small class="text text-primary">{{trans('room.imagedetailroom')}}</small>
              </div>
              <div class="col-md-12">
                <div id="preview_img">  
                </div>
                <input type="file" id="profileImage" name="profileImage[]" class="form-control-file" multiple="" required value="{{old('profileImage')}}">
              </div>
            </div>
          </div>
        </div>
      </div>
      <div class="card-footer">
        {{ Form::submit(trans('room.save'),['class' => 'btn btn-primary']) }}
        <a class="btn btn-outline-secondary" href="{{route('room.index')}}"><i class="fa fa-undo" aria-hidden="true"></i></a>
      </div>
      {{ Form::close() }} 
    </div>
  </div>
</div>
</div>
<script type="text/javascript" src="{{ asset('js/dropzone/dropzone.js') }}"></script>
<link rel="stylesheet" type="text/css" href="{{ asset('js/dropzone/dropzone.css') }}">
@endsection
@section('script')
@include('admin.shared.scrip')
<script>
  function readURL(file){
    if(file.files && file.files[0]){
      var reader = new FileReader();

      reader.onload = function(e){
        $('#preview_avatar').attr('src',e.target.result);
      }
      reader.readAsDataURL(file.files[0]);
    }
  };
  $("#image").change(function(){
      readURL(this)
    })
</script>
<script>
 $(document).ready(function(){
 $('#profileImage').on('change', function(){ //on file input change
    if (window.File && window.FileReader && window.FileList && window.Blob) //check File API supported browser
    {
        var data = $(this)[0].files; //this file data
        $.each(data, function(index, file){ //loop though each file
            if(/(\.|\/)(gif|jpe?g|png)$/i.test(file.type)){ //check supported file type
                var fRead = new FileReader(); //new filereader
                fRead.onload = (function(file){ //trigger function on successful read
                  return function(e) {
                    var img = $('<img style="width="100px" height="100px"/>').addClass('float-left ml-3 mb-3').attr('src', e.target.result); //create image element 
                    $('#preview_img').append(img); //append image to output element
                  };
                })(file);
                fRead.readAsDataURL(file); //URL representing the file's data.
              }
            });
      }else{
        alert("Your browser doesn't support File API!"); //if File API is absent
      }
    });
});
</script>

@endsection