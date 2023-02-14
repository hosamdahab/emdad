<!-- Modal -->
<div class="modal fade exampleModal{{$p->id}}" id="exampleModal{{$p->id}}" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true" style="text-align:right">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <h1 class="modal-title fs-5" id="exampleModalLabel">{{__('messages.add_offer')}}</h1>
      </div>
      <div class="modal-body">
       
      <form action="{{route('seller.product.add.offer')}}" method="post" id="product_add_offer">
        @csrf

        <input type="hidden" value="{{$p->id}}" name="myId">
        <div class="mb-3">
    <label for="exampleInputEmail1" class="form-label">{{__('messages.price')}}</label>
    <input type="text" name="unit_price" readonly value="{{$p->unit_price}}" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp">
  </div>

  <div class="mb-3">
    <label for="exampleInputEmail1" class="form-label">{{__('messages.price_after_discount')}}</label>
    <input type="text" name="price_after_discount" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp">
  </div>

  <div class="mb-3">
    <label for="exampleInputPassword1" class="form-label">{{__('messages.offer_start_date')}}</label>
    <input type="date" name="offer_start_date" class="form-control" id="exampleInputPassword1">
  </div>

  <div class="mb-3">
    <label for="exampleInputPassword1" class="form-label">{{__('messages.offer_end_date')}}</label>
    <input type="date" name="offer_end_date" class="form-control" id="exampleInputPassword1">
  </div>
  
 
  
        <button type="submit" class="btn btn-primary">{{__('messages.save')}}</button>
        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">{{__('messages.cancel')}}</button>
</form>

      </div>
   
    </div>
  </div>
</div>