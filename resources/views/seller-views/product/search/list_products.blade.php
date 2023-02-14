
@php
    $products = App\Model\Product::where('added_by','admin')->latest()->paginate(12);

@endphp
<div class="card-body" >

    <div class="table-responsive">
        <table class="table">
            <thead>
                <th>{{\App\CPU\translate('Product Image')}}</th>
                <th>{{\App\CPU\translate('Product Name')}}</th>
                <th>{{\App\CPU\translate('Product Quantity')}}</th>
                <th>{{\App\CPU\translate('Product Add')}}</th>
                <th>{{\App\CPU\translate('Product Size')}}</th>
            </thead>
            <tbody>
                @foreach ($products as $product)
                    <tr>
                        <td>
                        <img src="{{asset('product/'.$product->images)}}" alt="" width="100" height="100">
                        </td>
                        <td>{{ $product->name }}</td>
                        <td> {{ $product->unit_numbers }} {{ $product->unit }} </td>
                        <td>
                            <button class="btn btn-primary">{{\App\CPU\translate('Add')}}</button>
                        </td>
                        <td>
                            <button class="btn btn-light">{{\App\CPU\translate('Add Anather Size')}}</button>
                        </td>
                    </tr>
                @endforeach
            </tbody>
        </table>
    </div>
</div>

<div class="card-footer">
    {{$products->links()}}
</div>
