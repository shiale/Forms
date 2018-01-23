﻿
&НаКлиенте
Процедура ОтобратьПоОсновномуСкладу(Команда)
	ОтобратьПоОсновномуСкладуНаСервере();
КонецПроцедуры

&НаСервере
Процедура ОтобратьПоОсновномуСкладуНаСервере()
	
	Для Каждого ЭлементНастроек Из Список.КомпоновщикНастроек.ПользовательскиеНастройки.Элементы Цикл
		Если ТипЗнч(ЭлементНастроек) = Тип("ОтборКомпоновкиДанных") Тогда
			Отбор = ЭлементНастроек;
			Прервать;
		КонецЕсли;
	КонецЦикла;
	
	ОтборПоСкладу = Неопределено;
	ПолеСклад = Новый ПолеКомпоновкиДанных("Склад");
	
	Для Каждого ЭлементОтбора Из Отбор.Элементы Цикл
		Если ТипЗнч(ЭлементОтбора) = Тип("ЭлементОтбораКомпоновкиДанных") Тогда
			Если ЭлементОтбора.ЛевоеЗначение = ПолеСклад Тогда
				ОтборПоСкладу = ЭлементОтбора;
				Прервать;
			КонецЕсли;
		КонецЕсли;
	КонецЦикла;
	
	Если ОтборПоСкладу = Неопределено Тогда
		ОтборПоСкладу = Отбор.Элементы.Добавить(Тип("ЭлементОтбораКомпоновкиДанных"));
		ОтборПоСкладу.ЛевоеЗначение = ПолеСклад;
		ОтборПоСкладу.Использование = Истина;
	Иначе
		ОтборПоСкладу.Использование = Не ОтборПоСкладу.Использование;
	КонецЕсли;
	
	ОтборПоСкладу.ВидСравнения = ВидСравненияКомпоновкиДанных.Равно;
	ОтборПоСкладу.ПравоеЗначение = Константы.ОсновнойСклад.Получить();
	Элементы.ФормаОтобратьПоОсновномуСкладу.Пометка = ОтборПоСкладу.Использование;
	
КонецПроцедуры
