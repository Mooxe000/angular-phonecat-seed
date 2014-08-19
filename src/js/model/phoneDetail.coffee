# mainImage
$('.phone').attr 'ng-repeat', 'img in phone.images'
$('.phone').attr 'ng-src', '{{img}}'
$('.phone').attr 'ng-class', '{active: mainImageUrl==img}'

# thumbs
$('.phone-thumbs li').attr 'ng-repeat', 'img in phone.images'
$('.phone-thumbs li img').attr 'ng-src', '{{img}}'
$('.phone-thumbs li img').attr 'ng-click', 'setImage(img)'

# name
$('.phone-images +h1').attr 'ng-bind', 'phone.name'
# description
$('.phone-images +h1 +p').attr 'ng-bind', 'phone.description'

## Availability and Networks
$('.specs >li:eq(0) dd').attr 'ng-repeat', 'availability in phone.availability'
$('.specs >li:eq(0) dd').attr 'ng-bind', 'availability'

## Battery
$($('.specs >li:eq(1) dd')[0]).attr 'ng-bind', 'phone.battery.type'
$($('.specs >li:eq(1) dd')[1]).attr 'ng-bind', 'phone.battery.talkTime'
$($('.specs >li:eq(1) dd')[2]).attr 'ng-bind', 'phone.battery.standbyTime'

## Storage and Memory
$($('.specs >li:eq(2) dd')[0]).attr 'ng-bind', 'phone.storage.ram'
$($('.specs >li:eq(2) dd')[1]).attr 'ng-bind', 'phone.storage.flash'

## Connectivity
$($('.specs >li:eq(3) dd')[0]).attr 'ng-bind', 'phone.connectivity.cell'
$($('.specs >li:eq(3) dd')[1]).attr 'ng-bind', 'phone.connectivity.wifi'
$($('.specs >li:eq(3) dd')[2]).attr 'ng-bind', 'phone.connectivity.bluetooth'
$($('.specs >li:eq(3) dd')[3]).attr 'ng-bind', 'phone.connectivity.infrared | checkmark'
$($('.specs >li:eq(3) dd')[4]).attr 'ng-bind', 'phone.connectivity.gps | checkmark'

## Android
$($('.specs >li:eq(4) dd')[0]).attr 'ng-bind', 'phone.android.os'
$($('.specs >li:eq(4) dd')[1]).attr 'ng-bind', 'phone.android.ui'

## Size and Weight
$('.specs >li:eq(5) dd:first').attr 'ng-repeat', 'dim in phone.sizeAndWeight.dimensions'
$($('.specs >li:eq(5) dd')[0]).attr 'ng-bind', 'dim'
$($('.specs >li:eq(5) dd')[1]).attr 'ng-bind', 'phone.sizeAndWeight.weight'

## Display
$($('.specs >li:eq(6) dd')[0]).attr 'ng-bind', 'phone.display.screenSize'
$($('.specs >li:eq(6) dd')[1]).attr 'ng-bind', 'phone.display.screenResolution'
$($('.specs >li:eq(6) dd')[2]).attr 'ng-bind', 'phone.display.touchScreen | checkmark'

## Hardware
$($('.specs >li:eq(7) dd')[0]).attr 'ng-bind', 'phone.hardware.cpu'
$($('.specs >li:eq(7) dd')[1]).attr 'ng-bind', 'phone.hardware.usb'
$($('.specs >li:eq(7) dd')[2]).attr 'ng-bind', 'phone.hardware.audioJack'
$($('.specs >li:eq(7) dd')[3]).attr 'ng-bind', 'phone.hardware.fmRadio | checkmark'
$($('.specs >li:eq(7) dd')[4]).attr 'ng-bind', 'phone.hardware.accelerometer | checkmark'

## Camera
$($('.specs >li:eq(8) dd')[0]).attr 'ng-bind', 'phone.camera.primary'
$($('.specs >li:eq(8) dd')[1]).attr 'ng-bind', 'phone.camera.features.join(", ")'

## Additional Features
$($('.specs >li:eq(9) dd')[0]).attr 'ng-bind', 'phone.additionalFeatures'