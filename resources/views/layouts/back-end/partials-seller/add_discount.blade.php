<!-- Modal -->
<div class="modal fade exampleModal1" id="exampleModal1{{$p->id}}" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true" style="text-align:right">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <h1 class="modal-title fs-5" id="exampleModalLabel">{{__('messages.add_discount')}}</h1>
      </div>
      <div class="modal-body">
      <form action="{{route('seller.add.product.discount')}}" method="post" id="add_product_discount">
        @csrf

        <input type="hidden" value="{{$p->id}}" name="myId">
        <div class="mb-3">
    <label for="exampleInputEmail1" class="form-label">{{__('messages.price')}}</label>
    <input type="text" name="unit_price" readonly value="{{$p->unit_price}}" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp">
  </div>


  <div class="mb-3">
    <label for="exampleInputEmail1" class="form-label">{{__('messages.discount_percent')}}</label>
    <input type="number" name="discount" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp">
  </div>
  <div class="mb-3">
    <label for="exampleInputPassword1" class="form-label">{{__('messages.discount_start_date')}}</label>
    <input type="date" name="discount_start_date" class="form-control" id="exampleInputPassword1">
  </div>
 
  <div class="mb-3">
    <label for="exampleInputPassword1" class="form-label">{{__('messages.discount_end_date')}}</label>
    <input type="date" name="discount_end_date" class="form-control" id="exampleInputPassword1">
  </div>

  
        <button type="submit" class="btn btn-primary">{{__('messages.save')}}</button>
        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">{{__('messages.cancel')}}</button>
</form>
      </div>
     
       
    
    </div>
  </div>
</div>