﻿
&НаКлиенте
Процедура ЗапуститьВручную(Команда)
	ЗапуститьВручнуюНаСервере();
КонецПроцедуры

&НаСервере
Процедура ЗапуститьВручнуюНаСервере()
	
	ПараметрыВыполнения = Неопределено;
	ОбъектОбработки = РеквизитФормыВЗначение("Объект");
	ОбъектОбработки.ВыполнитьКоманду("ОтправкаОшибокЖРНаПочту", Новый Структура("ДополнительнаяОбработкаСсылка", Параметры.ДополнительнаяОбработкаСсылка));
	
КонецПроцедуры

&НаСервере
Процедура ПриСозданииНаСервере(Отказ, СтандартнаяОбработка)
	
	ОбработкаСсылка = Параметры.ДополнительнаяОбработкаСсылка;
	Если ЗначениеЗаполнено(ОбработкаСсылка) Тогда
		ХН = ОбщегоНазначения.ЗначениеРеквизитаОбъекта(ОбработкаСсылка, "ХранилищеНастроек");
		МассивПолучателейИзНастроек = ХН.Получить();
		Если ТипЗнч(МассивПолучателейИзНастроек) = Тип("Массив") Тогда
			СписокПолучателей.ЗагрузитьЗначения(МассивПолучателейИзНастроек);
		КонецЕсли; 
	КонецЕсли; 
		
КонецПроцедуры

&НаКлиенте
Процедура ЗаписатьНастройки(Команда)
	ЗаписатьНастройкиНаСервере();
КонецПроцедуры

&НаСервере
Процедура ЗаписатьНастройкиНаСервере()
	
	ОбработкаСсылка = Параметры.ДополнительнаяОбработкаСсылка;
	Если ЗначениеЗаполнено(ОбработкаСсылка) Тогда
		ОбработкаОбъект = ОбработкаСсылка.ПолучитьОбъект();
		ОбработкаОбъект.ХранилищеНастроек = Новый ХранилищеЗначения(СписокПолучателей.ВыгрузитьЗначения());
		ОбработкаОбъект.Записать();
		Модифицированность = Ложь;
	КонецЕсли; 
	
КонецПроцедуры

&НаКлиенте
Процедура СписокПолучателейПриИзменении(Элемент)
	
	Модифицированность = Истина;
	
КонецПроцедуры
