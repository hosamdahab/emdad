<div class="modal fade bd-example-modal" tabindex="-1" role="dialog" aria-labelledby="myLargeModalLabel"
    aria-hidden="true">
    <div class="modal-dialog modal-lg">
        <div class="modal-content">
            <div class="row">
                <div class="col-12 p-3">
                    <div class="card">
                        <div class="card-body">
                            <div>
                                <form action="{{ route('seller.product.add.new.size') }}" method="POST"
                                    enctype="multipart/form-data">
                                    @csrf
                                    

                                    <div class="mb-3">
                                            <input type="hidden" name="product_id" value="" id="pro_id">
                                            <input type="text" name="brand" value="{{$product->name}}" class="form-control"
                                                value="" id="brand" readonly>
                                        </div>

                                        <div class="mb-3">
                                            <input type="text" name="product_name" class="form-control"
                                                value="" id="product_name3" readonly>
                                        </div>

                                        <div class="mb-3">
                                            <input type="text" name="product_type" value="{{$product->product_type}}" class="form-control"
                                                placeholder="نوع المنتج" readonly>
                                        </div>

                                       
                                        <div class="mb-3">
                                        <select class="form-select" name="product_size" aria-label="Default select example">
                                                    <option value="غرام">غرام</option>
                                                    <option value="كيلو">كيلو</option>
                                                    <option value="ملي">ملي</option>
                                                    <option value="لتر">لتر</option>
                                            </select>
                                            </div>
                                      
                                            <div class="mb-3">
                                            <input type="text" name="qty_in_units" class="form-control"
                                                placeholder="الكمية فى كل وحدة">
                                        </div>

                                        <div class="mb-3">
                                            <input type="text" name="qty_in_carton" class="form-control"
                                                placeholder="الكمية في كل كرتونة">
                                        </div>
                                        

                                        <div class="mb-3">
                                            <input type="text" name="product_price" id="add_product_price2" class="form-control"
                                                placeholder="سعر المنتج">
                                        </div>

                                        <div class="mb-3">
                                            <input type="text" name="purchase_price"  class="form-control"
                                                placeholder="سعر الشراء">
                                                <span class="text-danger" id="price_error2"></span>
                                        </div>


                                        <div class="mb-3">
                                            <input type="text" name="qty_in_stock" class="form-control"
                                                placeholder="الكمية المتواجدة بالمستودع">
                                        </div>



                                        <div class="mb-3">
                                        <input type="file" class="form-control" name="image" id="inputGroupFile02">
                                       
                                        </div>



                                    
                                    <button type="submit" class="btn btn-primary rounded-pill"
                                        style="width: 100%;background: #645cb3;border:none">ارسال الطلب</button>
                                </form>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
</div>
