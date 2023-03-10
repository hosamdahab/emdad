@extends('backend.layouts.app')

@section('content')
<div class="aiz-titlebar text-left mt-2 mb-3">
    <div class="row align-items-center">
        <div class="col-md-6">
            <h1 class="h3">نوع التجاره</h1>
        </div>
        <div class="col-md-6 text-md-right">
            <a href="{{ route('departmenttyps.create') }}" class="btn btn-primary">
                <span>نشاط مهنه</span>
            </a>
        </div>
    </div>
</div>
<div class="card">
    <div class="card-header d-block d-md-flex">
        <h5 class="mb-0 h6">نوع التجاره</h5>
        <form class="" id="sort_categories" action="" method="GET">
            <div class="box-inline pad-rgt pull-left">
                <div class="" style="min-width: 200px;">
                    <input type="text" class="form-control" id="search" name="search"@isset($sort_search) value="{{ $sort_search }}" @endisset placeholder="{{ translate('Type name & Enter') }}">
                </div>
            </div>
        </form>
    </div>
    <div class="card-body">
        <table class="table aiz-table mb-0">
            <thead>
                <tr>
                    <th data-breakpoints="lg">#</th>
                    <th>{{translate('Name')}}</th>
                    <th>{{translate('category')}}</th>
                    <th data-breakpoints="lg">ايقونه</th>
                    <th data-breakpoints="lg">مفعله / ملغيه</th>
                    <th width="10%" class="text-right">{{translate('Options')}}</th>
                </tr>
            </thead>
            <tbody>
                @foreach($departmenttyps as $key => $departmenttyp)
                    <tr>
                        <td>{{ ($key+1) + ($departmenttyps->currentPage() - 1)*$departmenttyps->perPage() }}</td>
                        <td>{{ $departmenttyp->name }}</td>
                        <td>
                            @php
                                $parent = \App\Models\CategoryDep::where('id', $departmenttyp->category_dep_id)->first();
                            @endphp
                            @if ($parent != null)
                                {{ $parent->getTranslation('name') }}
                            @else
                                —
                            @endif
                        </td>
                        <td>
                            @if($departmenttyp->icon != null)
                                <span class="avatar avatar-square avatar-xs">
                                    <img src="{{ uploaded_asset($departmenttyp->icon) }}" alt="{{translate('icon')}}">
                                </span>
                            @else
                                —
                            @endif
                        </td>
                        <td>
                            <label class="aiz-switch aiz-switch-success mb-0">
                                <input type="checkbox" onchange="update_featured(this)" value="{{ $departmenttyp->id }}" <?php if($departmenttyp->featured == 1) echo "checked";?>>
                                <span></span>
                            </label>
                        </td>
                         <td class="text-right">
                            <a class="btn btn-soft-primary btn-icon btn-circle btn-sm" href="{{route('departmenttyps.edit', $departmenttyp->id) }}" title="{{ translate('Edit') }}">
                                <i class="las la-edit"></i>
                            </a>
                            <a href="#" class="btn btn-soft-danger btn-icon btn-circle btn-sm confirm-delete" data-href="{{route('departmenttyps.destroy', $departmenttyp->id)}}" title="{{ translate('Delete') }}">
                                <i class="las la-trash"></i>
                            </a>
                        </td>
                    </tr>
                @endforeach
            </tbody>
        </table>
        <div class="aiz-pagination">
            {{ $departmenttyps->appends(request()->input())->links() }}
        </div>
    </div>
</div>
@endsection


@section('modal')
    @include('modals.delete_modal')
@endsection


@section('script')
    <script type="text/javascript">
        function update_featured(el){
            if(el.checked){
                var status = 1;
            }
            else{
                var status = 0;
            }
            $.post('{{ route('departmenttyps.featured') }}', {_token:'{{ csrf_token() }}', id:el.value, status:status}, function(data){
                if(data == 1){
                    AIZ.plugins.notify('success', '{{ translate('Featured departmenttyps updated successfully') }}');
                }
                else{
                    AIZ.plugins.notify('danger', '{{ translate('Something went wrong') }}');
                }
            });
        }
    </script>
@endsection
