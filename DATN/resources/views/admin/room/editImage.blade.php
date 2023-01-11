@extends('admin.layouts.main')
@section('title', trans('room.titleimage'))
@section('content')
<div class="animated fadeIn">
  <div class="row">
    <div class="col-md-12">
      <div class="card">
        <div class="card-header">
          <strong class="card-title"> {{trans('room.titleimage')}} {!!$name->name!!}
          </strong>        
        </div>
        <div class="card-body">
          {{ Form::open(['route' => 'room.storeImage', 'method' => 'post','enctype '=>'multipart/form-data', 'files' => true]) }}
          <input type="hidden" name="id" value="{{$id}}" placeholder=""> 
          <input type="file" id="profileImage" name="profileImage[]" class="form-control" multiple="">
          @if($data)
          @foreach($data as $key => $data)
          <a type="button" class=" deletebutton text-danger btn" data-id="{{$data->id}}" data-toggle="modal" data-target="#Modal" >
           <img  src="{{ asset('administration/profile_images').'/'.$data->image_name }}" alt="Photo avatar" width="100px" height="100px">
         </a>
         @endforeach
         @endif
         <div id="preview_img">  
         </div>
       </div>
       <div class="card-footer">
        {{ Form::submit(trans('room.updateimage'),['class' => 'btn btn-primary ']) }}
        <a class="btn btn-outline-secondary" href="{{route('room.edit',$id)}}"><i class="fa fa-undo" aria-hidden="true"></i></a>
        {{ Form::close() }} 
      </div>

    </div>
  </div>
</div>
</div>
</div>
{{Form::open(['route' => ['imageRoom_delete'], 'method' => 'DELETE'])}}  
@include('admin.modal.modaldelete')
{{ Form::close() }}
@endsection
@section('script')
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
                    var img = $('<img style="width="100px" height="100px" "/>').addClass('float-left ml-3').attr('src', e.target.result); //create image element 
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
@include('admin.shared.notification')
@endsection
