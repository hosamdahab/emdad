    <section class="container rtl mt-3 mb-3">
        <div class="category-product-view-title mb-4" style="display: flow-root;">
            <span class="for-feature-title float-right" style="font-weight: 700;font-size: 20px;text-transform: uppercase;text-align:right;">
                {{ $category->name }}
            </span>
        </div>
        <div class="row rtl">
            @foreach ($sub_category as $sub)
                <div class="col-lg-2 col-md-3 col-6">
                    <a href="#" class="text-decoration-none">
                        <div class="card" style="border: none">
                            <div class="card-body">
                                <div>
                                    <img src="{{asset('storage/app/public/category')}}/{{$sub->icon}}" alt="{{$sub->name}}" style="width: 200px;height: 180px;">
                                </div>
                                <!--<div>-->
                                <!--    <h5>{{$sub->name}}</h5>-->
                                <!--</div>-->
                            </div>
                        </div>
                    </a>
                </div>
            @endforeach
        </div>
    </section>