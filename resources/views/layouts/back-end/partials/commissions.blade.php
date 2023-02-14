<div class="modal fade example-modal" tabindex="-1" role="dialog" aria-labelledby="myLargeModalLabel"
    aria-hidden="true">
    <div class="modal-dialog modal-lg">
        <div class="modal-content">
            <div class="row">
                <div class="col-12 p-3">
                    <div class="card">
                        <div class="card-body">
                            <div>
                                <form action="{{ route('admin.commissions.store') }}" id="admin_commissions" method="POST">
                                    @csrf
                                  
                                    <div class="input-group mb-3">
                                    @php($commissions = DB::table('admin_commissions')->find(1))

                                    @isset($commissions)
                                    <input type="number" value="{{$commissions->percent}}" name="commissions" placeholder="نسبة العمولة للمنصة" class="form-control" aria-label="Username" aria-describedby="basic-addon1">
                                    @endisset

                                    @empty($commissions)
                                    <input type="number" name="commissions" placeholder="نسبة العمولة للمنصة" class="form-control" aria-label="Username" aria-describedby="basic-addon1">
                                    @endempty
                                    <span class="input-group-text" id="basic-addon1">%</span>
                                    </div>
                                    
                                        <span class="text-danger" id="image-input-error"></span>
                                    
                                    <button type="submit" class="btn btn-primary rounded-pill"
                                        style="width: 100%;background: #645cb3;border:none">{{__('messages.save')}}</button>
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
