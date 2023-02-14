<style>
    .just-padding {
        padding: 15px;
        border: 1px solid #ccccccb3;
        border-bottom-left-radius: 5px;
        border-bottom-right-radius: 5px;
        height: 100%;
        background-color: white;
    }

    .carousel-control-prev,
    .carousel-control-next {
        width: 7% !important;
    }
</style>
<!-- CSS only -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet"
    integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">

<div class="row rtl">
    <div class="col-xl-3 d-none d-xl-block">
        <div></div>
    </div>

    <div class="col-xl-12 col-md-12"
        style="margin-top: 3px;{{ Session::get('direction') === 'rtl' ? 'padding-right:10px;' : 'padding-left:10px;' }}">
        @php(
            $main_banner = \App\Model\Banner::where('banner_type', 'Main Banner')->where('published', 1)->orderBy('id', 'desc')->get()
        )
        <div id="carouselExampleIndicators" class="carousel slide" data-ride="carousel">
            <ol class="carousel-indicators">
                @foreach ($main_banner as $key => $banner)
                    <li data-target="#carouselExampleIndicators" data-slide-to="{{ $key }}"
                        class="{{ $key == 0 ? 'active' : '' }}">
                    </li>
                @endforeach
            </ol>
            <div class="carousel-inner" style="border-radius:25px">
                @foreach ($main_banner as $key => $banner)
                    <div class="carousel-item {{ $key == 0 ? 'active' : '' }}">
                        <a href="#" class="banner_get" data-bs-toggle="modal"
                            data-bs-target="#exampleModal{{ $banner->id }}">
                            <img class="d-block w-100" style="max-height: 372px;"
                                onerror="this.src='{{ asset('public/assets/front-end/img/image-place-holder.png') }}'"
                                src="{{ asset('public/banner/' . $banner->photo) }}" alt="">

                            </a>

                    </div>

                    <!-- Modal -->
                    <div class="modal fade" id="exampleModal{{ $banner->id }}" tabindex="-1"
                        aria-labelledby="exampleModalLabel" aria-hidden="true">
                        <div class="modal-dialog">
                            <div class="modal-content">
                                @if (auth('customer')->check())
                                    <form action="{{ route('check.banner') }}" method="post" class="check_banner">
                                        @csrf
                                        <div class="modal-body" style="padding:0">
                                            <button type="button" style="position:absolute;top:1rem;left:1rem"
                                                class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                                            <img class="d-block w-100" style="max-height: 200px;"
                                                onerror="this.src='{{ asset('public/assets/front-end/img/image-place-holder.png') }}'"
                                                src="{{ asset('banner/' . $banner->photo) }}" alt="">

                                            <p style="position:relative;right:20px;top:20px">promo code
                                                {{ $banner->code }}</p>

                                            <?php
                                            $newDate = date('d/m/Y', strtotime($banner->created_at));
                                            $expire = date('d/m/Y', strtotime($banner->expire));
                                            ?>

                                            <p style="position:relative;right:20px;top:20px">{{ $newDate }}</p>

                                            <p style="padding:0 20px">{{ $banner->title }}</p>
                                            <input type="hidden" name="myId" value="{{ $banner->id }}">
                                            <input type="hidden" name="discount" value="{{ $banner->discount }}">

                                        </div>

                                        <div>

                                            <button type="submit" style="display:block;margin:auto;width:90%"
                                                class="btn btn-primary">فعله الان</button>
                                            <small style="margin: 10px auto 20px auto;text-align:center;display:block">
                                                حتي {{ $expire }}</small>


                                        </div>
                                    </form>
                                @else
                                    <div class="modal-body" style="padding:0">
                                        <button type="button" style="position:absolute;top:1rem;left:1rem"
                                            class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                                        <img class="d-block w-100" style="max-height: 200px;"
                                            onerror="this.src='{{ asset('public/assets/front-end/img/image-place-holder.png') }}'"
                                            src="{{ asset('banner/' . $banner->photo) }}" alt="">

                                        <p style="position:relative;right:20px;top:20px">promo code {{ $banner->code }}
                                        </p>

                                        <?php
                                        $newDate = date('d/m/Y', strtotime($banner->created_at));
                                        $expire = date('d/m/Y', strtotime($banner->expire));
                                        ?>

                                        <p style="position:relative;right:20px;top:20px">{{ $newDate }}</p>

                                        <p style="padding:0 20px">{{ $banner->title }}</p>
                                        <input type="hidden" name="code" value="{{ $banner->code }}">

                                    </div>

                                    <div>

                                        <a href="{{ route('customer.auth.login') }}"
                                            style="display:block;margin:auto;width:90%" class="btn btn-primary">فعله
                                            الان</a>
                                        <small style="margin: 10px auto 20px auto;text-align:center;display:block"> حتي
                                            {{ $expire }}</small>


                                    </div>
                                @endif


                            </div>
                        </div>
                    </div>


                @endforeach
            </div>
            <a class="carousel-control-prev" href="#carouselExampleIndicators" role="button" data-slide="prev">
                <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                <span class="sr-only">{{ \App\CPU\translate('Previous') }}</span>
            </a>
            <a class="carousel-control-next" href="#carouselExampleIndicators" role="button" data-slide="next">
                <span class="carousel-control-next-icon" aria-hidden="true"></span>
                <span class="sr-only">{{ \App\CPU\translate('Next') }}</span>
            </a>
        </div>

        {{-- <div class="row mt-2">
            @foreach (\App\Model\Banner::where('banner_type', 'Footer Banner')->where('published', 1)->orderBy('id', 'desc')->take(3)->get() as $banner)
                <div class="col-4">
                    <a data-toggle="modal" data-target="#quick_banner{{$banner->id}}"
                       style="cursor: pointer;">
                        <img class="d-block footer_banner_img" style="width: 100%"
                             onerror="this.src='{{asset('public/assets/front-end/img/image-place-holder.png')}}'"
                             src="{{asset('storage/app/public/banner')}}/{{$banner['photo']}}">
                    </a>
                </div>
                <div class="modal fade" id="quick_banner{{$banner->id}}" tabindex="-1"
                     role="dialog" aria-labelledby="exampleModalLongTitle"
                     aria-hidden="true">
                    <div class="modal-dialog modal-lg" role="document">
                        <div class="modal-content">
                            <div class="modal-header">
                                <p class="modal-title"
                                   id="exampleModalLongTitle">{{ \App\CPU\translate('banner_photo')}}</p>
                                <button type="button" class="close" data-dismiss="modal"
                                        aria-label="Close">
                                    <span aria-hidden="true">&times;</span>
                                </button>
                            </div>
                            <div class="modal-body">
                                <img class="d-block mx-auto"
                                     onerror="this.src='{{asset('public/assets/front-end/img/image-place-holder.png')}}'"
                                     src="{{asset('storage/app/public/banner')}}/{{$banner['photo']}}">
                                @if ($banner->url != '')
                                    <div class="text-center mt-2">
                                        <a href="{{$banner->url}}"
                                           class="btn btn-outline-accent">{{\App\CPU\translate('Explore')}} {{\App\CPU\translate('Now')}}</a>
                                    </div>
                                @endif
                            </div>
                        </div>
                    </div>
                </div>
            @endforeach
        </div> --}}
    </div>
    <!-- Banner group-->
</div>

<!-- JavaScript Bundle with Popper -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"
    integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4" crossorigin="anonymous">
</script>
<script>
    $(function() {
        $('.list-group-item').on('click', function() {
            $('.glyphicon', this)
                .toggleClass('glyphicon-chevron-right')
                .toggleClass('glyphicon-chevron-down');
        });
    });
</script>
