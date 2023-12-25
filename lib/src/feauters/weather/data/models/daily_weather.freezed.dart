// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'daily_weather.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

DailyWeather _$DailyWeatherFromJson(Map<String, dynamic> json) {
  return _DailyWeather.fromJson(json);
}

/// @nodoc
mixin _$DailyWeather {
  @JsonKey(name: 'temperature_2m_max')
  List<double> get temperature => throw _privateConstructorUsedError;
  @JsonKey(fromJson: WeatherCodeConverter.fromJson, name: 'weather_code')
  List<WeatherCondition> get condition => throw _privateConstructorUsedError;
  @JsonKey(name: 'time')
  List<DateTime> get date => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $DailyWeatherCopyWith<DailyWeather> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DailyWeatherCopyWith<$Res> {
  factory $DailyWeatherCopyWith(
          DailyWeather value, $Res Function(DailyWeather) then) =
      _$DailyWeatherCopyWithImpl<$Res, DailyWeather>;
  @useResult
  $Res call(
      {@JsonKey(name: 'temperature_2m_max') List<double> temperature,
      @JsonKey(fromJson: WeatherCodeConverter.fromJson, name: 'weather_code')
      List<WeatherCondition> condition,
      @JsonKey(name: 'time') List<DateTime> date});
}

/// @nodoc
class _$DailyWeatherCopyWithImpl<$Res, $Val extends DailyWeather>
    implements $DailyWeatherCopyWith<$Res> {
  _$DailyWeatherCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? temperature = null,
    Object? condition = null,
    Object? date = null,
  }) {
    return _then(_value.copyWith(
      temperature: null == temperature
          ? _value.temperature
          : temperature // ignore: cast_nullable_to_non_nullable
              as List<double>,
      condition: null == condition
          ? _value.condition
          : condition // ignore: cast_nullable_to_non_nullable
              as List<WeatherCondition>,
      date: null == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as List<DateTime>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$DailyWeatherImplCopyWith<$Res>
    implements $DailyWeatherCopyWith<$Res> {
  factory _$$DailyWeatherImplCopyWith(
          _$DailyWeatherImpl value, $Res Function(_$DailyWeatherImpl) then) =
      __$$DailyWeatherImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'temperature_2m_max') List<double> temperature,
      @JsonKey(fromJson: WeatherCodeConverter.fromJson, name: 'weather_code')
      List<WeatherCondition> condition,
      @JsonKey(name: 'time') List<DateTime> date});
}

/// @nodoc
class __$$DailyWeatherImplCopyWithImpl<$Res>
    extends _$DailyWeatherCopyWithImpl<$Res, _$DailyWeatherImpl>
    implements _$$DailyWeatherImplCopyWith<$Res> {
  __$$DailyWeatherImplCopyWithImpl(
      _$DailyWeatherImpl _value, $Res Function(_$DailyWeatherImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? temperature = null,
    Object? condition = null,
    Object? date = null,
  }) {
    return _then(_$DailyWeatherImpl(
      temperature: null == temperature
          ? _value._temperature
          : temperature // ignore: cast_nullable_to_non_nullable
              as List<double>,
      condition: null == condition
          ? _value._condition
          : condition // ignore: cast_nullable_to_non_nullable
              as List<WeatherCondition>,
      date: null == date
          ? _value._date
          : date // ignore: cast_nullable_to_non_nullable
              as List<DateTime>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$DailyWeatherImpl implements _DailyWeather {
  const _$DailyWeatherImpl(
      {@JsonKey(name: 'temperature_2m_max')
      required final List<double> temperature,
      @JsonKey(fromJson: WeatherCodeConverter.fromJson, name: 'weather_code')
      required final List<WeatherCondition> condition,
      @JsonKey(name: 'time') required final List<DateTime> date})
      : _temperature = temperature,
        _condition = condition,
        _date = date;

  factory _$DailyWeatherImpl.fromJson(Map<String, dynamic> json) =>
      _$$DailyWeatherImplFromJson(json);

  final List<double> _temperature;
  @override
  @JsonKey(name: 'temperature_2m_max')
  List<double> get temperature {
    if (_temperature is EqualUnmodifiableListView) return _temperature;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_temperature);
  }

  final List<WeatherCondition> _condition;
  @override
  @JsonKey(fromJson: WeatherCodeConverter.fromJson, name: 'weather_code')
  List<WeatherCondition> get condition {
    if (_condition is EqualUnmodifiableListView) return _condition;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_condition);
  }

  final List<DateTime> _date;
  @override
  @JsonKey(name: 'time')
  List<DateTime> get date {
    if (_date is EqualUnmodifiableListView) return _date;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_date);
  }

  @override
  String toString() {
    return 'DailyWeather(temperature: $temperature, condition: $condition, date: $date)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DailyWeatherImpl &&
            const DeepCollectionEquality()
                .equals(other._temperature, _temperature) &&
            const DeepCollectionEquality()
                .equals(other._condition, _condition) &&
            const DeepCollectionEquality().equals(other._date, _date));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_temperature),
      const DeepCollectionEquality().hash(_condition),
      const DeepCollectionEquality().hash(_date));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$DailyWeatherImplCopyWith<_$DailyWeatherImpl> get copyWith =>
      __$$DailyWeatherImplCopyWithImpl<_$DailyWeatherImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$DailyWeatherImplToJson(
      this,
    );
  }
}

abstract class _DailyWeather implements DailyWeather {
  const factory _DailyWeather(
      {@JsonKey(name: 'temperature_2m_max')
      required final List<double> temperature,
      @JsonKey(fromJson: WeatherCodeConverter.fromJson, name: 'weather_code')
      required final List<WeatherCondition> condition,
      @JsonKey(name: 'time')
      required final List<DateTime> date}) = _$DailyWeatherImpl;

  factory _DailyWeather.fromJson(Map<String, dynamic> json) =
      _$DailyWeatherImpl.fromJson;

  @override
  @JsonKey(name: 'temperature_2m_max')
  List<double> get temperature;
  @override
  @JsonKey(fromJson: WeatherCodeConverter.fromJson, name: 'weather_code')
  List<WeatherCondition> get condition;
  @override
  @JsonKey(name: 'time')
  List<DateTime> get date;
  @override
  @JsonKey(ignore: true)
  _$$DailyWeatherImplCopyWith<_$DailyWeatherImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
