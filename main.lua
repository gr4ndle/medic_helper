script_name ('Medic Helper v1.0') -- Название скрипта
script_author ('Кирилл Рыбак') --  Автор скрипта
script_description ('Helper') -- Описание скрипта

require "lib.moonloader" -- Загрузка библиотеки moonloader
local keys = require 'vkeys'
local imgui = require 'imgui' -- загружаем библиотеку
local encoding = require 'encoding'
encoding.default = 'CP1251'
u8 = encoding.UTF8

local main_color = 0x5A90CE -- Переменная основного цвета
local white_color = 0xFFFFFF -- Переменная белого цвета
local main_color_text = '{5A90CE}'
local white_color_text = '{FFFFFF}'

function main()
	if not isSampLoaded() or not isSampLoaded() then return end
	while not isSampAvailable() do wait(100) end

	_, id = sampGetPlayerIdByCharHandle(PLAYER_PED)
	nick = sampGetPlayerNickname(id)

	sampRegisterChatCommand('mc', cmd_mc)
	sampRegisterChatCommand('minsp', cmd_minsp)
	sampRegisterChatCommand('minject', cmd_minject)
	sampRegisterChatCommand('moperation', cmd_moperation)
	sampRegisterChatCommand('mvac', cmd_mvac)
	sampRegisterChatCommand('mkg', cmd_mkg)
	sampRegisterChatCommand('msex', cmd_msex)
	sampRegisterChatCommand('mmed', cmd_mmed)
	sampRegisterChatCommand('minvite', cmd_minvite)
	sampRegisterChatCommand('muninvite', cmd_muninvite)
	sampRegisterChatCommand('moffuninvite', cmd_moffuninvite)
	sampRegisterChatCommand('mrang', cmd_mrang)
	sampRegisterChatCommand('mwarn', cmd_mwarn)
	sampRegisterChatCommand('moffwarn', cmd_moffwarn)
	sampRegisterChatCommand('munwarn', cmd_munwarn)
	sampRegisterChatCommand('mskin', cmd_mskin)
	sampRegisterChatCommand('myskin', cmd_myskin)
	sampRegisterChatCommand('mordermed', cmd_mordermed)
	sampRegisterChatCommand('mawardall', cmd_mawardall)
	sampRegisterChatCommand('mawardone', cmd_mawardone)
	sampRegisterChatCommand('maward', cmd_maward)
	sampRegisterChatCommand('sobes', cmd_sobes)

	while true do -- Бесконечный Цикл
	wait(0)
			--=============================================================== ALT+2
			if isKeyDown(VK_CONTROL) and isKeyJustPressed(VK_R) then
			sampAddChatMessage('————————————————————', main_color)
			sampAddChatMessage('• Вы перезапустили{FFFFFF} - Medical Helper v 0.1', main_color)
			sampAddChatMessage('• Автор скрипта{FFFFFF} - Nico Rosberg', main_color)
			sampAddChatMessage('• Приятной игры на{FFFFFF} Diamond Role Play', main_color)
			sampAddChatMessage('————————————————————', main_color)
			end
			
			--=============================================================== Диалог с вводом ID F4
			if isKeyDown(VK_MENU) and isKeyJustPressed(VK_1) then
			sampSendChat("Здравствуйте, я ваш лечащий врач. Что вас беспокоит?")
			wait(500)
			sampShowDialog(15447, '{FFE599}Лечение игрока', '{FFFFFF}Введите {5A90CE}ID{FFFFFF} пациента', 'Принять', 'Отмена',1)
			repeat
			wait(0)
			re, button, list, input = sampHasDialogRespond(15447)
			until re

			if re and input and button == 1 then
			PID = input:match('(.+)')
			
			wait (500)
			
			sampShowDialog(15449, '{FFE599}Лечение игрока', '{FFFFFF}Введите {5A90CE}Цену{FFFFFF} лечения', 'Принять', 'Отмена',1)
			repeat
			wait(0)
			re, button, list, input = sampHasDialogRespond(15449)
			until re

			if re and input and button == 1 then
			CENA = input:match('(.+)')
			sampSendChat("/me осмотрел пациента и поставил диагноз")
			wait(2000)
			sampSendChat("/me открыл медицинскую сумку")
			wait(2000)
			sampSendChat("/me достал из медицинской сумки лекарство")
			wait(2000)
			sampSendChat("/do В руках стакан воды и лекарство.")
			wait(2000)
			sampSendChat("Держите, сейчас Вам станет легче.")
			wait(2000)
			sampSendChat("/me передал стакан воды и лекарство")
			wait(2000)
			sampSendChat("Удачного дня, не болейте!")
			wait(2000)
			sampSendChat("/anim 2 5")
			wait(2000)
			sampSendChat("/heal " .. PID .. " " .. CENA .. "")
			wait(2000)
			sampSendChat("/time")
			end
			end
			end
			
			--===============================================================
			
			if sampGetChatString(99):find('Connected. Joining the game...') then
			sampAddChatMessage('• Вы запустили{FFFFFF} - Medical Helper v 0.1', main_color)
			sampAddChatMessage('• Автор скрипта{FFFFFF} - Кирилл Рыбак', main_color)
			sampAddChatMessage('• Основная информация{FFFFFF} - /mc', main_color)
			sampAddChatMessage('• Приятной игры на{FFFFFF} Diamond Role Play', main_color)
			end
			
			--===============================================================
			--[[if isKeyJustPressed(VK_NEXT) then -- /map на PgDn
			sampSendChat('/map')
			end
			
			if isKeyJustPressed(VK_INSERT) then -- Починить/заправить авто
			sampSendChat('/fv')
			sampSendChat('/setfuel')
			end
			
			if isKeyJustPressed(VK_CAPITAL) then -- /time
			sampSendChat('/time')
			sampSendChat('/admins')
			end
			
			--=============================================================== Диалог с вводом ID F3
			if isKeyJustPressed(VK_F3) then
			sampShowDialog(15447, '{FFE599}Приятной игры', '{FFFFFF}Введите {5A90CE}ID{FFFFFF} игрока', 'Принять', 'Отмена',1)
			repeat
			wait(0)
			re, button, list, input = sampHasDialogRespond(15447)
			until re

			if re and input and button == 1 then
			PID = input:match('(.+)')
			sampSendChat("/ans " .. PID .. " Приятной игры и отличного настроения на Diamond Role Play | Radiant")
			sampSendChat("/ans " .. PID .. " Если вам помог администратор, вы можете отблагодарить его на форуме!")
			end
			end
			--===============================================================
			
			--=============================================================== Проверка на Anti AFK
			if isKeyJustPressed(VK_RCONTROL) then
			sampShowDialog(15447, '{FFE599}Anti AFK', '{FFFFFF}Введите {5A90CE}ID{FFFFFF} игрока', 'Принять', 'Отмена',1)
			repeat
			wait(0)
			re, button, list, input = sampHasDialogRespond(15447)
			until re

			if re and input and button == 1 then
			PID = input:match('(.+)')
			sampAddChatMessage('• Проверка на {FFFFFF}Anti AFK {5A90CE}через {FFFFFF}2 секунды', main_color)
			wait(2000)
			sampSendChat("/ans " .. PID .. " Здравствуйте, вы тут? Пройдитесь или напишите в чат 5-4=?")
			sampSendChat("/ans " .. PID .. " Здравствуйте, вы тут? Пройдитесь или напишите в чат 5-4=?")
			sampSendChat("/ans " .. PID .. " Здравствуйте, вы тут? Пройдитесь или напишите в чат 5-4=?")
			end
			end
			--===============================================================
			
			--=============================================================== ALT+3
			if isKeyDown(VK_MENU) and isKeyJustPressed(VK_3) then 
			sampShowDialog(15447, '{FFE599}Приятной игры', '{FFFFFF}Введите {5A90CE}ID{FFFFFF} игрока', 'Принять', 'Отмена',1)
			repeat
			wait(0)
			re, button, list, input = sampHasDialogRespond(15447)
			until re

			if re and input and button == 1 then
			PID = input:match('(.+)')
			sampSendChat("/ans " .. PID .. " Не наблюдаю нарушений от игрока.")
			end
			end
			--===============================================================
			
			--=============================================================== ALT+1
			if isKeyDown(VK_MENU) and isKeyJustPressed(VK_1) then
			sampShowDialog(15447, '{FFE599}Слежу за нарушителем', '{FFFFFF}Введите {5A90CE}ID{FFFFFF} игрока', 'Принять', 'Отмена',1)
			repeat
			wait(0)
			re, button, list, input = sampHasDialogRespond(15447)
			until re

			if re and input and button == 1 then
			PID = input:match('(.+)')
			sampSendChat("/ans " .. PID .. " Спасибо за сигнал, слежу за предполагаемым нарушителем.")
			end
			end
			--===============================================================
			
			--=============================================================== F2
			if isKeyDown(VK_F2) then
			sampSetChatInputEnabled(true)
			sampSetChatInputText("/ans ")
			end
			--===============================================================]]
	end
end

function cmd_mc()
	sampShowDialog(2817, '{FFE599}Medical Helper v 0.1', '{5A90CE}• {FFFFFF}Команды для врачей\n{5A90CE}• {FFFFFF}Команды для руководства\n{5A90CE}• {FFFFFF}Государственная Волна\n{5A90CE}• {FFFFFF}Информация о скрипте', 'Принять', 'Отмена',2) -- Основной диалог
	lua_thread.create(checker)
end

function checker()

	while sampIsDialogActive() do
	wait(0)
	local result, button, list, input = sampHasDialogRespond(2817)
		if result and list == 0 and button == 1 then
		sampShowDialog(28171, '{FFE599}Команды для врачей', '{5A90CE}• ALT + 1 {FFFFFF}- Лечить пациента\n{5A90CE}• /minsp {FFFFFF}- Провести мед. осмотр\n{5A90CE}• /minject {FFFFFF}- Сделать укол\n{5A90CE}• /moperation {FFFFFF}- Провести операцию\n{5A90CE}• /mvac {FFFFFF}- Провести вакцинацию\n{5A90CE}• /mkg {FFFFFF}- Клятва Гиппократа\n{5A90CE}• /msex {FFFFFF}- Операция по смене пола\n{5A90CE}• /mmed {FFFFFF}- Мед. сомотр Гос. Орг.\n{5A90CE}• CTRL + R {FFFFFF}- Перезагрузка скрипта\n\n\n{5A90CE}• Автор скрипта{FFFFFF} - Nico Rosberg\n{5A90CE}• Связаться с автором{FFFFFF} - vk.com/kev1h', 'Принять', '', 0)
		elseif result and list == 1 and button == 1 then
		sampShowDialog(28172, '{FFE599}Команды для руководства', '{5A90CE}• /minvite {FFFFFF}- Принять в фракцию\n{5A90CE}• /muninvite {FFFFFF}- Уволить из фракции\n{5A90CE}• /moffuninvite {FFFFFF}- Уволить в оффлайне\n{5A90CE}• /mrang {FFFFFF}- Повысить/понизить сотрудника\n{5A90CE}• /mwarn {FFFFFF}- Выдать выговор\n{5A90CE}• /moffwarn {FFFFFF}- Выдать выговор в оффе\n{5A90CE}• /munwarn {FFFFFF}- Снять выговор\n{5A90CE}• /mskin {FFFFFF}- Выдать форму\n{5A90CE}• /myskin {FFFFFF}- Выдать себе форму\n{5A90CE}• /mordermed {FFFFFF}- Заказать медикаменты\n{5A90CE}• /mawardall {FFFFFF}- Выдать премию всем сотрудникам\n{5A90CE}• /mawardone {FFFFFF}- Выдать премию одному сотруднику\n{5A90CE}• /maward {FFFFFF}- Выдать премию больницам {5A90CE}(Для министра)\n{5A90CE}• CTRL + R {FFFFFF}- Перезагрузка скрипта\n\n\n{5A90CE}• Автор скрипта{FFFFFF} - Nico Rosberg\n{5A90CE}• Связаться с автором{FFFFFF} - vk.com/kev1h', 'Принять', '', 0)
		elseif result and list == 2 and button == 1 then
		sampShowDialog(28173, '{FFE599}Гос. Волна', '{5A90CE}• {FFFFFF}Больница г.Лос-Сантос\n{5A90CE}• {FFFFFF}Больница г.Сан-Фиерро\n{5A90CE}• {FFFFFF}Больница г.Лас-Вентурас\n{5A90CE}• {FFFFFF}Больница г.Лос-Сантос {5A90CE}(Напоминалка)\n{5A90CE}• {FFFFFF}Больница г.Сан-Фиерро {5A90CE}(Напоминалка)\n{5A90CE}• {FFFFFF}Больница г.Лас-Вентурас {5A90CE}(Напоминалка)', 'Принять', 'Отмена', 2)
			while sampIsDialogActive() do
			wait(0)
			local result, button, list, input = sampHasDialogRespond(28173)
						if result and list == 0 and button == 1 then
						sampSendChat('/do На ремне закреплена рация.')
						wait(2000)
						sampSendChat('/me легким движением руки снял рацию с крепежа')
						wait(2000)
						sampSendChat('/do Рация в руках.')
						wait(2000)
						sampSendChat('/me настроил волну на Государственное вещание')
						wait(2000)
						sampSendChat('/l Начинаю вещание.')
						wait(2000)
						sampSendChat('/gnews HLS • Уважаемые жители Республики, минуточку внимания!')
						wait(100)
						sampSendChat('/gnews HLS • Сейчас пройдет собеседование в интернатуру Больницы г. Лос-Сантос.')
						wait(100)
						sampSendChat('/gnews HLS • Ждем в регистратуре, доп. информация в журнале «Vacancy».')
						wait(2000)
						sampSendChat('/l Закончил вещание.')
						wait(2000)
						sampSendChat('/me отключил рацию от Государственной волны')
						wait(2000)
						sampSendChat('/me закрепил рацию на пояс')
						wait(500)
						sampSendChat('/time')
					elseif result and list == 1 and button == 1 then
						sampSendChat('/do На ремне закреплена рация.')
						wait(2000)
						sampSendChat('/me легким движением руки снял рацию с крепежа')
						wait(2000)
						sampSendChat('/do Рация в руках.')
						wait(2000)
						sampSendChat('/me настроил волну на Государственное вещание')
						wait(2000)
						sampSendChat('/l Начинаю вещание.')
						wait(2000)
						sampSendChat('/gnews HSF • Уважаемые жители Республики, минуточку внимания!')
						wait(100)
						sampSendChat('/gnews HSF • Сейчас пройдет собеседование в интернатуру Больницы г. Сан-Фиерро.')
						wait(100)
						sampSendChat('/gnews HSF • Ждем в регистратуре, доп. информация в журнале «Vacancy».')
						wait(2000)
						sampSendChat('/l Закончил вещание.')
						wait(2000)
						sampSendChat('/me отключил рацию от Государственной волны')
						wait(2000)
						sampSendChat('/me закрепил рацию на пояс')
						wait(500)
						sampSendChat('/time')
					elseif result and list == 2 and button == 1 then
						sampSendChat('/do На ремне закреплена рация.')
						wait(2000)
						sampSendChat('/me легким движением руки снял рацию с крепежа')
						wait(2000)
						sampSendChat('/do Рация в руках.')
						wait(2000)
						sampSendChat('/me настроил волну на Государственное вещание')
						wait(2000)
						sampSendChat('/l Начинаю вещание.')
						wait(2000)
						sampSendChat('/gnews HLV • Уважаемые жители Республики, минуточку внимания!')
						wait(100)
						sampSendChat('/gnews HLV • Сейчас пройдет собеседование в интернатуру Больницы г. Лас-Вентурас.')
						wait(100)
						sampSendChat('/gnews HLV • Ждем в регистратуре, доп. информация в журнале «Vacancy».')
						wait(2000)
						sampSendChat('/l Закончил вещание.')
						wait(2000)
						sampSendChat('/me отключил рацию от Государственной волны')
						wait(2000)
						sampSendChat('/me закрепил рацию на пояс')
						wait(500)
						sampSendChat('/time')
					elseif result and list == 3 and button == 1 then
						sampSendChat('/do На ремне закреплена рация.')
						wait(2000)
						sampSendChat('/me легким движением руки снял рацию с крепежа')
						wait(2000)
						sampSendChat('/do Рация в руках.')
						wait(2000)
						sampSendChat('/me настроил волну на Государственное вещание')
						wait(2000)
						sampSendChat('/l Начинаю вещание.')
						wait(2000)
						sampSendChat('/gnews HLV • Напоминаю, что проходит собеседование в Больницу г. Лас-Вентурас.')
						wait(2000)
						sampSendChat('/l Закончил вещание.')
						wait(2000)
						sampSendChat('/me отключил рацию от Государственной волны')
						wait(2000)
						sampSendChat('/me закрепил рацию на пояс')
						wait(500)
						sampSendChat('/time')
					elseif result and list == 4 and button == 1 then
						sampSendChat('/do На ремне закреплена рация.')
						wait(2000)
						sampSendChat('/me легким движением руки снял рацию с крепежа')
						wait(2000)
						sampSendChat('/do Рация в руках.')
						wait(2000)
						sampSendChat('/me настроил волну на Государственное вещание')
						wait(2000)
						sampSendChat('/l Начинаю вещание.')
						wait(2000)
						sampSendChat('/gnews HLV • Напоминаю, что проходит собеседование в Больницу г. Лас-Вентурас.')
						wait(2000)
						sampSendChat('/l Закончил вещание.')
						wait(2000)
						sampSendChat('/me отключил рацию от Государственной волны')
						wait(2000)
						sampSendChat('/me закрепил рацию на пояс')
						wait(500)
						sampSendChat('/time')
					elseif result and list == 5 and button == 1 then
						sampSendChat('/do На ремне закреплена рация.')
						wait(2000)
						sampSendChat('/me легким движением руки снял рацию с крепежа')
						wait(2000)
						sampSendChat('/do Рация в руках.')
						wait(2000)
						sampSendChat('/me настроил волну на Государственное вещание')
						wait(2000)
						sampSendChat('/l Начинаю вещание.')
						wait(2000)
						sampSendChat('/gnews HLV • Напоминаю, что проходит собеседование в Больницу г. Лас-Вентурас.')
						wait(2000)
						sampSendChat('/l Закончил вещание.')
						wait(2000)
						sampSendChat('/me отключил рацию от Государственной волны')
						wait(2000)
						sampSendChat('/me закрепил рацию на пояс')
						wait(500)
						sampSendChat('/time')
						end
						end
		elseif result and list == 3 and button == 1 then
		sampShowDialog(28173, '{FFE599}Информация о скрипте', '{5A90CE}• Вы запустили{FFFFFF} - Medical Helper v 0.1\n{5A90CE}• Автор скрипта{FFFFFF} - Кирилл Рыбак\n{5A90CE}• Основная информация{FFFFFF} - /mc\n{5A90CE}• Приятной игры на{FFFFFF} Diamond Role Play', 'Принять', '', 0)
				end
			end
		end

function cmd_minsp()
	sampShowDialog(15445, '{FFE599}Выдача мед. карты', '{FFFFFF}Введите {5A90CE}ID{FFFFFF} пациента', 'Принять', 'Отмена',1)
	lua_thread.create(minsp)
end	

function minsp()
	while sampIsDialogActive() do
	wait(0)
	
			repeat
			wait(100)
			re, button, list, input = sampHasDialogRespond(15445)
			until re

			if re and input and button == 1 then
			PID = input:match('(.+)')
			
	sampSendChat('Покажите пожалуйста ваш паспорт.')
	wait(2000)
	sampSendChat('/n /pass ' .. id .. '')
	wait(500)
	
			sampAddChatMessage('{FFFFFF}Нажмите: {008000}1 {FFFFFF}- продолжить | {FF0000}2 {FFFFFF}- отмена', white_color)
			while not isKeyDown(VK_1) do
			wait(0)
			if isKeyDown(VK_2) then
			sampSendChat('Хм...')
			return
			end
			end
		
	sampSendChat('/do В мед. сумке папка для заполнения мед. карты.')
	wait(2000)
	sampSendChat('/me достал тонометр и надел его на руку пациента')
	wait(2000)
	sampSendChat('/do Тонометр показал давление - 120 на 70.')
	wait(2000)
	sampSendChat('/me измерил пульс пациента')
	wait(2000)
	sampSendChat('/do Пульс в норме.')
	wait(2000)
	sampSendChat('/me достал папку для заполнения мед. карты')
	wait(2000)
	sampSendChat('/me открыл папку, затем что-то записал в нее, после чего поставил печать «Здоров».')
	wait(2000)
	sampSendChat('/me поставил печать «Ministry Of Health»')
	wait(2000)
	sampSendChat('/do Мед. карта готова.')
	wait(2000)
	sampSendChat('/me передал мед. карту человеку напротив')
	wait(2000)
	sampSendChat('/medcard ' .. PID .. "")
	wait(500)
	sampSendChat('/time')
	end
	end
end

function cmd_minject()
	sampShowDialog(15446, '{FFE599}Сделать укол', '{FFFFFF}Введите {5A90CE}ID{FFFFFF} пациента', 'Принять', 'Отмена',1)
	lua_thread.create(minject)
end

function minject()
	while sampIsDialogActive() do
	wait(0)
	
			repeat
			wait(100)
			re, button, list, input = sampHasDialogRespond(15446)
			until re

			if re and input and button == 1 then
			PID = input:match('(.+)')
			
	sampSendChat('/do На столе шприц,ампула с лекарством и емкость со спиртом.')
	wait(2000)
	sampSendChat('/me взял со стола шприц и ампулу с лекарством')
	wait(2000)
	sampSendChat('/me взял ватку и спирт')
	wait(2000)
	sampSendChat('/me смочил ватку спиртом')
	wait(2000)
	sampSendChat('/me оголил нужную часть тела пациента')
	wait(2000)
	sampSendChat('/me смазал ватой кожу')
	wait(2000)
	sampSendChat('/me сделал укол')
	wait(2000)
	sampSendChat('/inject ' .. PID .. '')
	wait(2000)
	sampSendChat('/me приложил ватку к месту укола')
	wait(2000)
	sampSendChat('Прижмите плотно ватку и держите ее в течении четырёх минут.')
	wait(500)
	sampSendChat('/time')
	end
	end
end

function cmd_moperation()
	lua_thread.create(moperation)
end

function moperation()
	sampSendChat('/do В мед. сумке лежит спиртовой раствор для рук.')
	wait(2000)
	sampSendChat('/me простерилизовал руки спиртовым раствором')
	wait(2000)
	sampSendChat('/me надел на руки перчатки')
	wait(2000)
	sampSendChat('/me взял в руки заполненный шприц с наркозом')
	wait(2000)
	sampSendChat('/do Шприц заполнен наркозом.')
	wait(2000)
	sampSendChat('/me вколол шприц в вену пациента')
	wait(2000)
	sampSendChat('/me начал процесс операции над болезнью пациента')
	wait(2000)
	sampSendChat('/do Процесс операции закончен.')
	wait(2000)
	sampSendChat('/do Пациент пришел в себя.')
	wait(500)
	sampSendChat('/time')
	end

function cmd_mvac()
	sampShowDialog(15448, '{FFE599}Провести вакцинацию', '{FFFFFF}Введите {5A90CE}ID{FFFFFF} пациента', 'Принять', 'Отмена',1)
	lua_thread.create(mvac)
end

function mvac()
	while sampIsDialogActive() do
	wait(0)
	
			repeat
			wait(100)
			re, button, list, input = sampHasDialogRespond(15448)
			until re

			if re and input and button == 1 then
			PID = input:match('(.+)')
			
	sampSendChat('Дайте пожалуйста вашу руку.')
	wait(500)
	
			sampAddChatMessage('{FFFFFF}Нажмите: {008000}1 {FFFFFF}- от Гриппа | {008000}2 {FFFFFF}- от Ангины', white_color)
			sampAddChatMessage('{FFFFFF}Нажмите: {008000}3 {FFFFFF}- от Бронхита | {008000}4 {FFFFFF}- от Эболы', white_color)
			while not isKeyDown(VK_1) do
			wait(0)
			if isKeyDown(VK_2) then
				sampSendChat('/do На столе шприц,ампула с лекарством и емкость со спиртом.')
				wait(2000)
				sampSendChat('/me взял со стола шприц и ампулу с вакциной от «Ангины»')
				wait(2000)
				sampSendChat('/me взял ватку и спирт')
				wait(2000)
				sampSendChat('/me смочил ватку спиртом')
				wait(2000)
				sampSendChat('/me оголил нужную часть тела пациента')
				wait(2000)
				sampSendChat('/me смазал ватой кожу')
				wait(2000)
				sampSendChat('/me сделал укол')
				wait(2000)
				sampSendChat('/me приложил ватку к месту укола')
				wait(2000)
				sampSendChat('Прижмите плотно ватку и держите ее в течении четырёх минут.')
				wait(2000)
				sampSendChat('/vac ' .. PID .. ' 2 650')
				wait(500)
				sampSendChat('/time')
			return
			elseif isKeyDown(VK_3) then
				sampSendChat('/do На столе шприц,ампула с лекарством и емкость со спиртом.')
				wait(2000)
				sampSendChat('/me взял со стола шприц и ампулу с вакциной от «Бронхита»')
				wait(2000)
				sampSendChat('/me взял ватку и спирт')
				wait(2000)
				sampSendChat('/me смочил ватку спиртом')
				wait(2000)
				sampSendChat('/me оголил нужную часть тела пациента')
				wait(2000)
				sampSendChat('/me смазал ватой кожу')
				wait(2000)
				sampSendChat('/me сделал укол')
				wait(2000)
				sampSendChat('/me приложил ватку к месту укола')
				wait(2000)
				sampSendChat('Прижмите плотно ватку и держите ее в течении четырёх минут.')
				wait(2000)
				sampSendChat('/vac ' .. PID .. ' 3 750')
				wait(500)
				sampSendChat('/time')
			return
			elseif isKeyDown(VK_4) then
				sampSendChat('/do На столе шприц,ампула с лекарством и емкость со спиртом.')
				wait(2000)
				sampSendChat('/me взял со стола шприц и ампулу с вакциной от «Эболы»')
				wait(2000)
				sampSendChat('/me взял ватку и спирт')
				wait(2000)
				sampSendChat('/me смочил ватку спиртом')
				wait(2000)
				sampSendChat('/me оголил нужную часть тела пациента')
				wait(2000)
				sampSendChat('/me смазал ватой кожу')
				wait(2000)
				sampSendChat('/me сделал укол')
				wait(2000)
				sampSendChat('/me приложил ватку к месту укола')
				wait(2000)
				sampSendChat('Прижмите плотно ватку и держите ее в течении четырёх минут.')
				wait(2000)
				sampSendChat('/vac ' .. PID .. ' 4 850')
				wait(500)
				sampSendChat('/time')
			return
			end
			end
		
	sampSendChat('/do На столе шприц,ампула с лекарством и емкость со спиртом.')
	wait(2000)
	sampSendChat('/me взял со стола шприц и ампулу с вакциной от «Гриппа»')
	wait(2000)
	sampSendChat('/me взял ватку и спирт')
	wait(2000)
	sampSendChat('/me смочил ватку спиртом')
	wait(2000)
	sampSendChat('/me оголил нужную часть тела пациента')
	wait(2000)
	sampSendChat('/me смазал ватой кожу')
	wait(2000)
	sampSendChat('/me сделал укол')
	wait(2000)
	sampSendChat('/me приложил ватку к месту укола')
	wait(2000)
	sampSendChat('Прижмите плотно ватку и держите ее в течении четырёх минут.')
	wait(2000)
	sampSendChat('/vac ' .. PID .. ' 1 550')
	wait(500)
	sampSendChat('/time')
	end
	end
end

function cmd_mkg()
	lua_thread.create(mkg)
end

function mkg()
	sampSendChat('Клянусь Аполлоном, врачом Асклепием, Гигеей и Панакеей, всеми богами и богинями.')
	wait(2000)
	sampSendChat('Cчитать научившего меня врачебному искусству наравне с моими родителями.')
	wait(2000)
	sampSendChat('Делиться с ним своими достатками и в случае надобности помогать ему в его нуждах.')
	wait(2000)
	sampSendChat('Чисто и непорочно буду я проводить свою жизнь и свое искусство.')
	wait(2000)
	sampSendChat('Мне, нерушимо выполняющему клятву.')
	wait(2000)
	sampSendChat('Да будет дано счастье в жизни и в искусстве и славе у всех людей на вечные времена.')
	wait(2000)
	sampSendChat('Преступающему же и дающему ложную клятву да будет обратное этому!')
	wait(500)
	sampSendChat('/time')
	end

function cmd_msex()
	sampShowDialog(15449, '{FFE599}Операция по смене пола', '{FFFFFF}Введите {5A90CE}ID{FFFFFF} пациента', 'Принять', 'Отмена',1)
	lua_thread.create(msex)
end

function msex()
	while sampIsDialogActive() do
	wait(0)
	
			repeat
			wait(100)
			re, button, list, input = sampHasDialogRespond(15449)
			until re

			if re and input and button == 1 then
			PID = input:match('(.+)')
	
	sampSendChat('Раздевайтесь пожалуйста.')
	wait(500)
	
			sampAddChatMessage('{FFFFFF}Нажмите: {008000}1 {FFFFFF}- сменить на Муж. | {008000}2 {FFFFFF}- сменить на Жен.', white_color)
			while not isKeyDown(VK_1) do
			wait(0)
			if isKeyDown(VK_2) then
				sampSendChat('/me надел перчатки')
				wait(2000)
				sampSendChat('/me надел маску для наркоза пациенту')
				wait(2000)
				sampSendChat('/me включил аппарат для наркоза')
				wait(2000)
				sampSendChat('/do Пациент заснул.')
				wait(2000)
				sampSendChat('/me взяв скальпель сделал надрез')
				wait(2000)
				sampSendChat('/me сменил пол пациенту')
				wait(2000)
				sampSendChat('/me взяв мед.нитки и иглу наложил швы')
				wait(2000)
				sampSendChat('/me взяв бинты обмотал швы')
				wait(2000)
				sampSendChat('/me отключил аппарат для наркоза')
				wait(2000)
				sampSendChat('/me снял маску для наркоза с пациента')
				wait(2000)
				sampSendChat('/do Пациент проснулся.')
				wait(2000)
				sampSendChat('/setsex ' .. PID .. ' 2')
				wait(500)
				sampSendChat('/time')
			return
			end
			end
			
	sampSendChat('/me надел перчатки')
	wait(2000)
	sampSendChat('/me надел маску для наркоза пациенту')
	wait(2000)
	sampSendChat('/me включил аппарат для наркоза')
	wait(2000)
	sampSendChat('/do Пациент заснул.')
	wait(2000)
	sampSendChat('/me взяв скальпель сделал надрез')
	wait(2000)
	sampSendChat('/me сменил пол пациенту')
	wait(2000)
	sampSendChat('/me взяв мед.нитки и иглу наложил швы')
	wait(2000)
	sampSendChat('/me взяв бинты обмотал швы')
	wait(2000)
	sampSendChat('/me отключил аппарат для наркоза')
	wait(2000)
	sampSendChat('/me снял маску для наркоза с пациента')
	wait(2000)
	sampSendChat('/do Пациент проснулся.')
	wait(2000)
	sampSendChat('/setsex ' .. PID .. ' 1')
	wait(500)
	sampSendChat('/time')
	end
	end
end

function cmd_mmed()
	lua_thread.create(mmed)
end

function mmed()
	sampSendChat('/me достал тонометр и надел его на руку пациента')
	wait(2000)
	sampSendChat('/do Тонометр показал давление - 120 на 70.')
	wait(2000)
	sampSendChat('/me измерил пульс пациента')
	wait(2000)
	sampSendChat('/do Пульс в норме.')
	wait(2000)
	sampSendChat('/me открыл папку, затем что-то записал в нее, после чего поставил печать «Здоров».')
	wait(2000)
	sampSendChat('/me поставил печать «Ministry Of Health»')
	wait(500)
	sampSendChat('/time')
	end

function cmd_minvite()
	sampShowDialog(15450, '{FFE599}Принять во фракцию', '{FFFFFF}Введите {5A90CE}ID{FFFFFF} гражданина', 'Принять', 'Отмена',1)
	lua_thread.create(minvite)
end	

function minvite()
	while sampIsDialogActive() do
	wait(0)
	
			repeat
			wait(100)
			re, button, list, input = sampHasDialogRespond(15450)
			until re

			if re and input and button == 1 then
			PID = input:match('(.+)')
			
	sampSendChat('Ваш паспорт пожалуйста.')
	wait(500)
	
			sampAddChatMessage('{FFFFFF}Нажмите: {008000}1 {FFFFFF}- продолжить | {FF0000}2 {FFFFFF}- отмена', white_color)
			while not isKeyDown(VK_1) do
			wait(0)
			if isKeyDown(VK_2) then
			sampSendChat('Хм...')
			return
			end
			end
	sampSendChat('/me достал телефон, после чего зашел в раздел «Министерства Здравоохранения»')
	wait(2000)
	sampSendChat('/me зашел в раздел «Сотрудники», ввел данные о человеке и нажал «Добавить»')
	wait(2000)
	sampSendChat('/do На экране надпись «Успешно».')
	wait(2000)
	sampSendChat('/do В дипломате лежит чистый комплект с формой.')
	wait(2000)
	sampSendChat('/me движением левой руки приоткрыл дипломат и достал форму')
	wait(2000)
	sampSendChat('/todo Держите.*передавая форму человеку')
	wait(2000)
	sampSendChat('/anim 2 5')
	wait(2000)
	sampSendChat('/invite ' .. PID .. '')
	wait(500)
	sampSendChat('/time')
	end		
	end
end

function cmd_muninvite()
	sampShowDialog(15451, '{FFE599}Увольнение', '{FFFFFF}Введите {5A90CE}ID{FFFFFF} гражданина', 'Принять', 'Отмена',1)
	lua_thread.create(muninvite)
end

function muninvite()
	while sampIsDialogActive() do
	wait(0)
	
			repeat
			wait(100)
			re, button, list, input = sampHasDialogRespond(15451)
			until re

			if re and input and button == 1 then
			PID = input:match('(.+)')
			
			wait (500)
			
			sampShowDialog(15452, '{FFE599}Увольнение', '{FFFFFF}Введите {5A90CE}Причину{FFFFFF} увольнения\n\n{5A90CE}Пример: {FFFFFF}LS | По собственному желанию.', 'Принять', 'Отмена',1)
			repeat
			wait(0)
			re, button, list, input = sampHasDialogRespond(15452)
			until re
			
			if re and input and button == 1 then
			PRICHINA = input:match('(.+)')
		
	sampSendChat('/me достал телефон, после чего зашел в раздел «Министерства Здравоохранения»')
	wait(2000)
	sampSendChat('/me зашел в раздел «Сотрудники», ввел данные о человеке и нажал «Удалить»')
	wait(2000)
	sampSendChat('/do На экране надпись «Успешно».')
	wait(2000)
	sampSendChat('/uninvite ' .. PID .. ' ' .. PRICHINA .. '')
	wait(500)
	sampSendChat('/time')
			end		
		end
	end
end

function cmd_moffuninvite()
	sampShowDialog(15452, '{FFE599}Увольнение в оффе', '{FFFFFF}Введите {5A90CE}Nick_Name{FFFFFF} гражданина', 'Принять', 'Отмена',1)
	lua_thread.create(moffuninvite)
end

function moffuninvite()
	while sampIsDialogActive() do
	wait(0)
	
			repeat
			wait(100)
			re, button, list, input = sampHasDialogRespond(15452)
			until re

			if re and input and button == 1 then
			PID = input:match('(.+)')
			
			wait (500)
			
			sampShowDialog(15453, '{FFE599}Увольнение в оффе', '{FFFFFF}Введите {5A90CE}Причину{FFFFFF} увольнения\n\n{5A90CE}Пример: {FFFFFF}LS | По собственному желанию.', 'Принять', 'Отмена',1)
			repeat
			wait(0)
			re, button, list, input = sampHasDialogRespond(15453)
			until re
			
			if re and input and button == 1 then
			PRICHINA = input:match('(.+)')
		
	sampSendChat('/me достал телефон, после чего зашел в раздел «Министерства Здравоохранения»')
	wait(2000)
	sampSendChat('/me зашел в раздел «Сотрудники», ввел данные о человеке и нажал «Удалить»')
	wait(2000)
	sampSendChat('/do На экране надпись «Успешно».')
	wait(2000)
	sampSendChat('/uninviteoff ' .. PID .. ' ' .. PRICHINA .. '')
	wait(500)
	sampSendChat('/time')
			end		
		end
	end
end
	

function cmd_mrang()
	sampShowDialog(15453, '{FFE599}Повысить/Понизить', '{FFFFFF}Введите {5A90CE}ID{FFFFFF} сотрудника', 'Принять', 'Отмена',1)
	lua_thread.create(mrang)
end

function mrang()
	while sampIsDialogActive() do
	wait(0)
	
			repeat
			wait(100)
			re, button, list, input = sampHasDialogRespond(15453)
			until re

			if re and input and button == 1 then
			PID = input:match('(.+)')
		
	sampSendChat('/me достал телефон, после чего зашел в раздел «Министерства Здравоохранения»')
	wait(2000)
	sampSendChat('/me зашел в раздел «Должности Сотрудников», нашел человека и нажал «Изменить»')
	wait(2000)
	sampSendChat('/do На экране надпись «Успешно».')
	wait(500)
	sampSendChat('/time')
	wait(500)
	sampSendChat('/rang ' .. PID .. '')
			end		
		end
	end

function cmd_mwarn()
	sampShowDialog(15454, '{FFE599}Выдать выговор', '{FFFFFF}Введите {5A90CE}ID{FFFFFF} сотрудника', 'Принять', 'Отмена',1)
	lua_thread.create(mwarn)
end

function mwarn()
	while sampIsDialogActive() do
	wait(0)
	
			repeat
			wait(100)
			re, button, list, input = sampHasDialogRespond(15454)
			until re

			if re and input and button == 1 then
			PID = input:match('(.+)')
			
			wait (500)
			
			sampShowDialog(15455, '{FFE599}Выдать выговор', '{FFFFFF}Введите {5A90CE}Причину{FFFFFF} выговора\n\n{5A90CE}Пример: {FFFFFF}LS | Нарушение устава.', 'Принять', 'Отмена',1)
			repeat
			wait(0)
			re, button, list, input = sampHasDialogRespond(15455)
			until re
			
			if re and input and button == 1 then
			PRICHINA = input:match('(.+)')
		
	sampSendChat('/me достал телефон, после чего зашел в раздел «Министерства Здравоохранения»')
	wait(2000)
	sampSendChat('/me зашел в раздел «Взыскания Сотрудников», нашел человека и нажал «Изменить»')
	wait(2000)
	sampSendChat('/do На экране надпись «Успешно».')
	wait(500)
	sampSendChat('/time')
	wait(500)
	sampSendChat('/fwarn ' .. PID .. ' ' .. PRICHINA .. '')
			end		
		end
	end
end

function cmd_moffwarn()
	sampShowDialog(15455, '{FFE599}Выдать выговор в оффе', '{FFFFFF}Введите {5A90CE}Nick_Name{FFFFFF} сотрудника', 'Принять', 'Отмена',1)
	lua_thread.create(moffwarn)
end

function moffwarn()
	while sampIsDialogActive() do
	wait(0)
	
			repeat
			wait(100)
			re, button, list, input = sampHasDialogRespond(15455)
			until re

			if re and input and button == 1 then
			PID = input:match('(.+)')
			
			wait (500)
			
			sampShowDialog(15456, '{FFE599}Выдать выговор в оффе', '{FFFFFF}Введите {5A90CE}Причину{FFFFFF} выговора\n\n{5A90CE}Пример: {FFFFFF}LS | Нарушение устава.', 'Принять', 'Отмена',1)
			repeat
			wait(0)
			re, button, list, input = sampHasDialogRespond(15456)
			until re
			
			if re and input and button == 1 then
			PRICHINA = input:match('(.+)')
		
	sampSendChat('/me достал телефон, после чего зашел в раздел «Министерства Здравоохранения»')
	wait(2000)
	sampSendChat('/me зашел в раздел «Взыскания Сотрудников», нашел человека и нажал «Изменить»')
	wait(2000)
	sampSendChat('/do На экране надпись «Успешно».')
	wait(500)
	sampSendChat('/time')
	wait(500)
	sampSendChat('/fwarnoff ' .. PID .. ' ' .. PRICHINA .. '')
			end		
		end
	end
end

function cmd_munwarn()
	sampShowDialog(15456, '{FFE599}Снять выговор', '{FFFFFF}Введите {5A90CE}ID{FFFFFF} сотрудника', 'Принять', 'Отмена',1)
	lua_thread.create(munwarn)
end

function munwarn()
	while sampIsDialogActive() do
	wait(0)
	
			repeat
			wait(100)
			re, button, list, input = sampHasDialogRespond(15456)
			until re

			if re and input and button == 1 then
			PID = input:match('(.+)')
			
			wait (500)
			
			sampShowDialog(15457, '{FFE599}Снять выговор', '{FFFFFF}Введите {5A90CE}Причину{FFFFFF} снятия выговора\n\n{5A90CE}Пример: {FFFFFF}LS | Отработал.', 'Принять', 'Отмена',1)
			repeat
			wait(0)
			re, button, list, input = sampHasDialogRespond(15457)
			until re
			
			if re and input and button == 1 then
			PRICHINA = input:match('(.+)')
		
	sampSendChat('/me достал телефон, после чего зашел в раздел «Министерства Здравоохранения»')
	wait(2000)
	sampSendChat('/me зашел в раздел «Взыскания Сотрудников», нашел человека и нажал «Изменить»')
	wait(2000)
	sampSendChat('/do На экране надпись «Успешно».')
	wait(500)
	sampSendChat('/time')
	wait(500)
	sampSendChat('/unfwarn ' .. PID .. ' ' .. PRICHINA .. '')
			end		
		end
	end
end

function cmd_mskin()
	sampShowDialog(15457, '{FFE599}Сменить форму', '{FFFFFF}Введите {5A90CE}ID{FFFFFF} сотрудника', 'Принять', 'Отмена',1)
	lua_thread.create(mskin)
end

function mskin()
	while sampIsDialogActive() do
	wait(0)
	
			repeat
			wait(100)
			re, button, list, input = sampHasDialogRespond(15457)
			until re

			if re and input and button == 1 then
			PID = input:match('(.+)')
		
	sampSendChat('/do В дипломате лежит комплект с чистой формой.')
	wait(2000)
	sampSendChat('/me свободной рукой приоткрыл дипломат и достал форму')
	wait(2000)
	sampSendChat('/todo Держите.*передавая комплект человеку напротив')
	wait(2000)
	sampSendChat('/anim 2 5')
	wait(500)
	sampSendChat('/setskin ' .. PID .. '')
			end		
		end
	end

function cmd_myskin()
	lua_thread.create(myskin)
end

function myskin()
		
	sampSendChat('/do В дипломате лежит комплект с чистой формой.')
	wait(2000)
	sampSendChat('/me свободной рукой приоткрыл дипломат и достал форму')
	wait(2000)
	sampSendChat('/me переодевается в новую форму')
	wait(2000)
	sampSendChat('/do Процесс...')
	wait(2000)
	sampSendChat('/me переоделся и положил старую форму в дипломат')
	wait(2000)
	sampSendChat('/anim 2 8')
	wait(500)
	sampSendChat('/setskin ' .. id .. '')
	
end

function cmd_mordermed()
	sampShowDialog(15458, '{FFE599}Заказ медикаментов', '{FFFFFF}Введите {5A90CE}Кол-во{FFFFFF} медикаментов\n\nНельзя меньше - {008000}1000$', 'Принять', 'Отмена',1)
	lua_thread.create(mordermed)
end

function mordermed()
	while sampIsDialogActive() do
	wait(0)
	
			repeat
			wait(100)
			re, button, list, input = sampHasDialogRespond(15458)
			until re

			if re and input and button == 1 then
			PID = input:match('(.+)')
		
	sampSendChat('/do На столе стоит персональный компьютер.')
	wait(2000)
	sampSendChat('/me правой рукой взял мышку')
	wait(2000)
	sampSendChat('/me зашел на сайт «Склад МЗ» и заказал «' .. PID .. '» медикаментов')
	wait(2000)
	sampSendChat('/me нажал на кнопку «Подтвердить»')
	wait(2000)
	sampSendChat('/do На экране надпись «Успешно»')
	wait(500)
	sampSendChat('/time')
	end
	end
end

function cmd_mawardall()
	sampShowDialog(15459, '{FFE599}Премия всем сотрудникам', '{FFFFFF}Введите {5A90CE}Сумму{FFFFFF} премии\n\nНельзя меньше - {008000}100$ {FFFFFF}и больше - {008000}3000$', 'Принять', 'Отмена',1)
	lua_thread.create(mawardall)
end

function mawardall()
	while sampIsDialogActive() do
	wait(0)
	
			repeat
			wait(100)
			re, button, list, input = sampHasDialogRespond(15459)
			until re

			if re and input and button == 1 then
			PID = input:match('(.+)')
		
	sampSendChat('/do На столе стоит персональный компьютер.')
	wait(2000)
	sampSendChat('/me правой рукой взял мышку')
	wait(2000)
	sampSendChat('/me зашел на сайт «Премии МЗ» и выдал «' .. PID .. '$» всем сотрудникам')
	wait(2000)
	sampSendChat('/me нажал на кнопку «Подтвердить»')
	wait(2000)
	sampSendChat('/do На экране надпись «Успешно»')
	wait(500)
	sampSendChat('/time')
	end
	end
end

function cmd_mawardone()
	sampShowDialog(15460, '{FFE599}Премия одному сотруднику', '{FFFFFF}Введите {5A90CE}Сумму{FFFFFF} премии\n\nНельзя меньше - {008000}100$ {FFFFFF}и больше - {008000}9000$', 'Принять', 'Отмена',1)
	lua_thread.create(mawardone)
end

function mawardone()
	while sampIsDialogActive() do
	wait(0)
	
			repeat
			wait(100)
			re, button, list, input = sampHasDialogRespond(15460)
			until re

			if re and input and button == 1 then
			PID = input:match('(.+)')
		
	sampSendChat('/do На столе стоит персональный компьютер.')
	wait(2000)
	sampSendChat('/me правой рукой взял мышку')
	wait(2000)
	sampSendChat('/me зашел на сайт «Премии МЗ» и выдал «' .. PID .. '$» сотруднику')
	wait(2000)
	sampSendChat('/me нажал на кнопку «Подтвердить»')
	wait(2000)
	sampSendChat('/do На экране надпись «Успешно»')
	wait(500)
	sampSendChat('/time')
	end
	end
end

function cmd_maward()
	sampShowDialog(15461, '{FFE599}Премия всем больницам', '{FFFFFF}Введите {5A90CE}Сумму{FFFFFF} премии\n\nНельзя меньше - {008000}100$ {FFFFFF}и больше - {008000}9000$', 'Принять', 'Отмена',1)
	lua_thread.create(maward)
end

function maward()
	while sampIsDialogActive() do
	wait(0)
	
			repeat
			wait(100)
			re, button, list, input = sampHasDialogRespond(15461)
			until re

			if re and input and button == 1 then
			PID = input:match('(.+)')
		
	sampSendChat('/do На столе стоит персональный компьютер.')
	wait(2000)
	sampSendChat('/me правой рукой взял мышку')
	wait(2000)
	sampSendChat('/me зашел на сайт «Премии МЗ» и выдал «' .. PID .. '$» каждой больнице')
	wait(2000)
	sampSendChat('/me нажал на кнопку «Подтвердить»')
	wait(2000)
	sampSendChat('/do На экране надпись «Успешно»')
	wait(500)
	sampSendChat('/time')
	end
	end
end

function cmd_sobes()
	sampShowDialog(15462, '{FFE599}Собеседование', '{FFFFFF}Введите {5A90CE}ID{FFFFFF} гражданина', 'Принять', 'Отмена',1)
	lua_thread.create(sobes)
end

function sobes()
	while sampIsDialogActive() do
	wait(0)
	
			repeat
			wait(100)
			re, button, list, input = sampHasDialogRespond(15462)
			until re

			if re and input and button == 1 then
			PID = input:match('(.+)')
			
	sampSendChat('Здравствуйте, вы на собеседование?')
	wait(500)
	
			sampAddChatMessage('{FFFFFF}Нажмите: {008000}1 {FFFFFF}- продолжить | {FF0000}2 {FFFFFF}- отмена', white_color)
			while not isKeyDown(VK_1) do
			wait(0)
			if isKeyDown(VK_2) then
			sampSendChat('Хм...')
			return
			end
			end
		
	sampSendChat('Хорошо, представьтесь пожалуйста.')
	wait(2000)
	sampSendChat('/n Имя Фамилия')
	wait(500)
	
			sampAddChatMessage('{FFFFFF}Нажмите: {008000}1 {FFFFFF}- продолжить | {FF0000}2 {FFFFFF}- отмена', white_color)
			while not isKeyDown(VK_1) do
			wait(0)
			if isKeyDown(VK_2) then
			sampSendChat('Хм...')
			return
			end
			end
	
	sampSendChat('Хорошо, документы ваши пожалуйста.')
	wait(2000)
	sampSendChat('/n /pass ' .. id .. ' | /lic ' .. id .. ' | /med ' .. id .. '')
	wait(500)
			
			sampAddChatMessage('{FFFFFF}Критерии: {008000}3 лвл {FFFFFF}| {008000}18 законки {FFFFFF}| {008000}Права на ТС {FFFFFF}| {008000}Мед. карта', white_color)
			sampAddChatMessage('{FFFFFF}Нажмите: {008000}1 {FFFFFF}- продолжить | {FF0000}2 {FFFFFF}- отмена', white_color)
			while not isKeyDown(VK_1) do
			wait(0)
			if isKeyDown(VK_2) then
			sampSendChat('Хм...')
			return
			end
			
			end
	sampSendChat('Отлично, сейчас я вам задам несколько вопросов.')
	wait(2000)
	sampSendChat('Первый: Что у меня над головой?')
	wait(500)
	
			sampAddChatMessage('{FFFFFF}Нажмите: {008000}1 {FFFFFF}- продолжить | {FF0000}2 {FFFFFF}- отмена', white_color)
			while not isKeyDown(VK_1) do
			wait(0)
			if isKeyDown(VK_2) then
			sampSendChat('Хм...')
			return
			end
			end
	
	sampSendChat('Второй: Какого цвета у меня Ник?')
	wait(500)
	
			sampAddChatMessage('{FFFFFF}Нажмите: {008000}1 {FFFFFF}- продолжить | {FF0000}2 {FFFFFF}- отмена', white_color)
			while not isKeyDown(VK_1) do
			wait(0)
			if isKeyDown(VK_2) then
			sampSendChat('Хм...')
			return
			end
			end
	
	sampSendChat('Последний: Что такое, по вашему мнению - РП, СК, ТК?')
	wait(500)
	
			sampAddChatMessage('{FFFFFF}Нажмите: {008000}1 {FFFFFF}- продолжить | {FF0000}2 {FFFFFF}- отмена', white_color)
			while not isKeyDown(VK_1) do
			wait(0)
			if isKeyDown(VK_2) then
			sampSendChat('Хм...')
			return
			end
			end
	
	sampSendChat('Отлично, думаю вы нам подходите.')
	wait(2000)
	sampSendChat('/r Гражданин с номером паспорта ' .. PID .. " прошел собеседование.")
	wait(500)
	sampSendChat('/time')
	end
	end
end

--[[ ЗАПОМНИ. Для продолжения выполнения кода

	sampSendChat('Давай документы')
		sampAddChatMessage('{FFFFFF}Нажмите: {008000}1 {FFFFFF}- продолжить | {FF0000}2 {FFFFFF}- отмена', white_color)
		while not isKeyDown(VK_1) do
		wait(0)
		if isKeyDown(VK_2) then
		sampSendChat('Хм...')
		return
		end
		end
	sampSendChat('Красава, спс за доки')
	
]]--