{{-- <style>
    .list-group-item li, a {
        color: {{$web_config['primary_color']}};
    }

    .list-group-item li, a:hover {
        color: {{$web_config['secondary_color']}};
    }
</style> --}}
{{-- <ul class="list-group list-group-flush">
    @foreach($products as $i)
        <li class="list-group-item" onclick="$('.search_form').submit()">
            <a href="javascript:" onmouseover="$('.search-bar-input-mobile').val('{{$i['name']}}');$('.search-bar-input').val('{{$i['name']}}');">
                {{$i['name']}}
            </a>
        </li>
    @endforeach
</ul> --}}

<ul style="list-style: none;padding: 0;">
    @if (empty($products))
    
        <h5 class="text-center text-danger">{{ App\CPU\translate('product_not_available') }}</h5>
    @else
        @foreach ($products as $product)

        @php
            $brand = DB::table('brands')
                        ->where('id',$product->brand_id)
                        ->first();
            $category = DB::table('categories')
                        ->where('id',$product->category_ids)
                        ->first();
        @endphp

            <li>
                <div class="d-flex">
                    <a class="text-decoration-none" href="{{ route('product.view',$product->id) }}">
                        <img src="{{asset('public/product/thumbnail') .'/' . $product->thumbnail}}" width="40px">
                    </a>
                    <div class="pr-3">
                        <a class="text-decoration-none" href="{{ route('product.view',$product->id) }}" style="margin-left: 10px;font-size:14px;">
                            {{ $brand->name .' '. $product->name }}
                        </a>
                        <div>
                            <span style="font-size: 12px;color:#9c9c9c">{{ $category->name }}</span>
                        </div>
                    </div>
                </div>
                <div>
                    <i class="fa fa-external-link"></i>
                </div>

            </li>
        @endforeach
    @endif
</ul>
