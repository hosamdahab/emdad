<!-- Modal -->
<div class="modal fade exampleModal" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <h1 class="modal-title fs-5" id="exampleModalLabel">مدة السداد</h1>
        
      </div>
      <div class="modal-body">
         <form action="{{route('seller.product.deferred.store')}}" method="post" id="deferred_sale_form">
              @csrf 
              <div class="mb-3">
                <label for="exampleInputPassword1" class="form-label">الفتره الزمنية للسداد</label>
                <input type="number" name="payment_in" min="1" value="1" class="form-control" id="exampleInputPassword1">
              </div>
              <input type="hidden" name="product_id" value="{{$order->id}}">
              <button class="btn btn-primary" type="submit">حفظ</button>
              <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">الغاء</button>
          </form>
      </div>
      
    </div>
  </div>
</div>