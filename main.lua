script_name ('Medic Helper v1.0') -- �������� �������
script_author ('������ �����') --  ����� �������
script_description ('Helper') -- �������� �������

require "lib.moonloader" -- �������� ���������� moonloader
local keys = require 'vkeys'
local imgui = require 'imgui' -- ��������� ����������
local encoding = require 'encoding'
encoding.default = 'CP1251'
u8 = encoding.UTF8

local main_color = 0x5A90CE -- ���������� ��������� �����
local white_color = 0xFFFFFF -- ���������� ������ �����
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

	while true do -- ����������� ����
	wait(0)
			--=============================================================== ALT+2
			if isKeyDown(VK_CONTROL) and isKeyJustPressed(VK_R) then
			sampAddChatMessage('��������������������', main_color)
			sampAddChatMessage('� �� �������������{FFFFFF} - Medical Helper v 0.1', main_color)
			sampAddChatMessage('� ����� �������{FFFFFF} - Nico Rosberg', main_color)
			sampAddChatMessage('� �������� ���� ��{FFFFFF} Diamond Role Play', main_color)
			sampAddChatMessage('��������������������', main_color)
			end
			
			--=============================================================== ������ � ������ ID F4
			if isKeyDown(VK_MENU) and isKeyJustPressed(VK_1) then
			sampSendChat("������������, � ��� ������� ����. ��� ��� ���������?")
			wait(500)
			sampShowDialog(15447, '{FFE599}������� ������', '{FFFFFF}������� {5A90CE}ID{FFFFFF} ��������', '�������', '������',1)
			repeat
			wait(0)
			re, button, list, input = sampHasDialogRespond(15447)
			until re

			if re and input and button == 1 then
			PID = input:match('(.+)')
			
			wait (500)
			
			sampShowDialog(15449, '{FFE599}������� ������', '{FFFFFF}������� {5A90CE}����{FFFFFF} �������', '�������', '������',1)
			repeat
			wait(0)
			re, button, list, input = sampHasDialogRespond(15449)
			until re

			if re and input and button == 1 then
			CENA = input:match('(.+)')
			sampSendChat("/me �������� �������� � �������� �������")
			wait(2000)
			sampSendChat("/me ������ ����������� �����")
			wait(2000)
			sampSendChat("/me ������ �� ����������� ����� ���������")
			wait(2000)
			sampSendChat("/do � ����� ������ ���� � ���������.")
			wait(2000)
			sampSendChat("�������, ������ ��� ������ �����.")
			wait(2000)
			sampSendChat("/me ������� ������ ���� � ���������")
			wait(2000)
			sampSendChat("�������� ���, �� �������!")
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
			sampAddChatMessage('� �� ���������{FFFFFF} - Medical Helper v 0.1', main_color)
			sampAddChatMessage('� ����� �������{FFFFFF} - ������ �����', main_color)
			sampAddChatMessage('� �������� ����������{FFFFFF} - /mc', main_color)
			sampAddChatMessage('� �������� ���� ��{FFFFFF} Diamond Role Play', main_color)
			end
			
			--===============================================================
			--[[if isKeyJustPressed(VK_NEXT) then -- /map �� PgDn
			sampSendChat('/map')
			end
			
			if isKeyJustPressed(VK_INSERT) then -- ��������/��������� ����
			sampSendChat('/fv')
			sampSendChat('/setfuel')
			end
			
			if isKeyJustPressed(VK_CAPITAL) then -- /time
			sampSendChat('/time')
			sampSendChat('/admins')
			end
			
			--=============================================================== ������ � ������ ID F3
			if isKeyJustPressed(VK_F3) then
			sampShowDialog(15447, '{FFE599}�������� ����', '{FFFFFF}������� {5A90CE}ID{FFFFFF} ������', '�������', '������',1)
			repeat
			wait(0)
			re, button, list, input = sampHasDialogRespond(15447)
			until re

			if re and input and button == 1 then
			PID = input:match('(.+)')
			sampSendChat("/ans " .. PID .. " �������� ���� � ��������� ���������� �� Diamond Role Play | Radiant")
			sampSendChat("/ans " .. PID .. " ���� ��� ����� �������������, �� ������ ������������� ��� �� ������!")
			end
			end
			--===============================================================
			
			--=============================================================== �������� �� Anti AFK
			if isKeyJustPressed(VK_RCONTROL) then
			sampShowDialog(15447, '{FFE599}Anti AFK', '{FFFFFF}������� {5A90CE}ID{FFFFFF} ������', '�������', '������',1)
			repeat
			wait(0)
			re, button, list, input = sampHasDialogRespond(15447)
			until re

			if re and input and button == 1 then
			PID = input:match('(.+)')
			sampAddChatMessage('� �������� �� {FFFFFF}Anti AFK {5A90CE}����� {FFFFFF}2 �������', main_color)
			wait(2000)
			sampSendChat("/ans " .. PID .. " ������������, �� ���? ���������� ��� �������� � ��� 5-4=?")
			sampSendChat("/ans " .. PID .. " ������������, �� ���? ���������� ��� �������� � ��� 5-4=?")
			sampSendChat("/ans " .. PID .. " ������������, �� ���? ���������� ��� �������� � ��� 5-4=?")
			end
			end
			--===============================================================
			
			--=============================================================== ALT+3
			if isKeyDown(VK_MENU) and isKeyJustPressed(VK_3) then 
			sampShowDialog(15447, '{FFE599}�������� ����', '{FFFFFF}������� {5A90CE}ID{FFFFFF} ������', '�������', '������',1)
			repeat
			wait(0)
			re, button, list, input = sampHasDialogRespond(15447)
			until re

			if re and input and button == 1 then
			PID = input:match('(.+)')
			sampSendChat("/ans " .. PID .. " �� �������� ��������� �� ������.")
			end
			end
			--===============================================================
			
			--=============================================================== ALT+1
			if isKeyDown(VK_MENU) and isKeyJustPressed(VK_1) then
			sampShowDialog(15447, '{FFE599}����� �� �����������', '{FFFFFF}������� {5A90CE}ID{FFFFFF} ������', '�������', '������',1)
			repeat
			wait(0)
			re, button, list, input = sampHasDialogRespond(15447)
			until re

			if re and input and button == 1 then
			PID = input:match('(.+)')
			sampSendChat("/ans " .. PID .. " ������� �� ������, ����� �� �������������� �����������.")
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
	sampShowDialog(2817, '{FFE599}Medical Helper v 0.1', '{5A90CE}� {FFFFFF}������� ��� ������\n{5A90CE}� {FFFFFF}������� ��� �����������\n{5A90CE}� {FFFFFF}��������������� �����\n{5A90CE}� {FFFFFF}���������� � �������', '�������', '������',2) -- �������� ������
	lua_thread.create(checker)
end

function checker()

	while sampIsDialogActive() do
	wait(0)
	local result, button, list, input = sampHasDialogRespond(2817)
		if result and list == 0 and button == 1 then
		sampShowDialog(28171, '{FFE599}������� ��� ������', '{5A90CE}� ALT + 1 {FFFFFF}- ������ ��������\n{5A90CE}� /minsp {FFFFFF}- �������� ���. ������\n{5A90CE}� /minject {FFFFFF}- ������� ����\n{5A90CE}� /moperation {FFFFFF}- �������� ��������\n{5A90CE}� /mvac {FFFFFF}- �������� ����������\n{5A90CE}� /mkg {FFFFFF}- ������ ����������\n{5A90CE}� /msex {FFFFFF}- �������� �� ����� ����\n{5A90CE}� /mmed {FFFFFF}- ���. ������ ���. ���.\n{5A90CE}� CTRL + R {FFFFFF}- ������������ �������\n\n\n{5A90CE}� ����� �������{FFFFFF} - Nico Rosberg\n{5A90CE}� ��������� � �������{FFFFFF} - vk.com/kev1h', '�������', '', 0)
		elseif result and list == 1 and button == 1 then
		sampShowDialog(28172, '{FFE599}������� ��� �����������', '{5A90CE}� /minvite {FFFFFF}- ������� � �������\n{5A90CE}� /muninvite {FFFFFF}- ������� �� �������\n{5A90CE}� /moffuninvite {FFFFFF}- ������� � ��������\n{5A90CE}� /mrang {FFFFFF}- ��������/�������� ����������\n{5A90CE}� /mwarn {FFFFFF}- ������ �������\n{5A90CE}� /moffwarn {FFFFFF}- ������ ������� � ����\n{5A90CE}� /munwarn {FFFFFF}- ����� �������\n{5A90CE}� /mskin {FFFFFF}- ������ �����\n{5A90CE}� /myskin {FFFFFF}- ������ ���� �����\n{5A90CE}� /mordermed {FFFFFF}- �������� �����������\n{5A90CE}� /mawardall {FFFFFF}- ������ ������ ���� �����������\n{5A90CE}� /mawardone {FFFFFF}- ������ ������ ������ ����������\n{5A90CE}� /maward {FFFFFF}- ������ ������ ��������� {5A90CE}(��� ��������)\n{5A90CE}� CTRL + R {FFFFFF}- ������������ �������\n\n\n{5A90CE}� ����� �������{FFFFFF} - Nico Rosberg\n{5A90CE}� ��������� � �������{FFFFFF} - vk.com/kev1h', '�������', '', 0)
		elseif result and list == 2 and button == 1 then
		sampShowDialog(28173, '{FFE599}���. �����', '{5A90CE}� {FFFFFF}�������� �.���-������\n{5A90CE}� {FFFFFF}�������� �.���-������\n{5A90CE}� {FFFFFF}�������� �.���-��������\n{5A90CE}� {FFFFFF}�������� �.���-������ {5A90CE}(�����������)\n{5A90CE}� {FFFFFF}�������� �.���-������ {5A90CE}(�����������)\n{5A90CE}� {FFFFFF}�������� �.���-�������� {5A90CE}(�����������)', '�������', '������', 2)
			while sampIsDialogActive() do
			wait(0)
			local result, button, list, input = sampHasDialogRespond(28173)
						if result and list == 0 and button == 1 then
						sampSendChat('/do �� ����� ���������� �����.')
						wait(2000)
						sampSendChat('/me ������ ��������� ���� ���� ����� � �������')
						wait(2000)
						sampSendChat('/do ����� � �����.')
						wait(2000)
						sampSendChat('/me �������� ����� �� ��������������� �������')
						wait(2000)
						sampSendChat('/l ������� �������.')
						wait(2000)
						sampSendChat('/gnews HLS � ��������� ������ ����������, ��������� ��������!')
						wait(100)
						sampSendChat('/gnews HLS � ������ ������� ������������� � ����������� �������� �. ���-������.')
						wait(100)
						sampSendChat('/gnews HLS � ���� � ������������, ���. ���������� � ������� �Vacancy�.')
						wait(2000)
						sampSendChat('/l �������� �������.')
						wait(2000)
						sampSendChat('/me �������� ����� �� ��������������� �����')
						wait(2000)
						sampSendChat('/me �������� ����� �� ����')
						wait(500)
						sampSendChat('/time')
					elseif result and list == 1 and button == 1 then
						sampSendChat('/do �� ����� ���������� �����.')
						wait(2000)
						sampSendChat('/me ������ ��������� ���� ���� ����� � �������')
						wait(2000)
						sampSendChat('/do ����� � �����.')
						wait(2000)
						sampSendChat('/me �������� ����� �� ��������������� �������')
						wait(2000)
						sampSendChat('/l ������� �������.')
						wait(2000)
						sampSendChat('/gnews HSF � ��������� ������ ����������, ��������� ��������!')
						wait(100)
						sampSendChat('/gnews HSF � ������ ������� ������������� � ����������� �������� �. ���-������.')
						wait(100)
						sampSendChat('/gnews HSF � ���� � ������������, ���. ���������� � ������� �Vacancy�.')
						wait(2000)
						sampSendChat('/l �������� �������.')
						wait(2000)
						sampSendChat('/me �������� ����� �� ��������������� �����')
						wait(2000)
						sampSendChat('/me �������� ����� �� ����')
						wait(500)
						sampSendChat('/time')
					elseif result and list == 2 and button == 1 then
						sampSendChat('/do �� ����� ���������� �����.')
						wait(2000)
						sampSendChat('/me ������ ��������� ���� ���� ����� � �������')
						wait(2000)
						sampSendChat('/do ����� � �����.')
						wait(2000)
						sampSendChat('/me �������� ����� �� ��������������� �������')
						wait(2000)
						sampSendChat('/l ������� �������.')
						wait(2000)
						sampSendChat('/gnews HLV � ��������� ������ ����������, ��������� ��������!')
						wait(100)
						sampSendChat('/gnews HLV � ������ ������� ������������� � ����������� �������� �. ���-��������.')
						wait(100)
						sampSendChat('/gnews HLV � ���� � ������������, ���. ���������� � ������� �Vacancy�.')
						wait(2000)
						sampSendChat('/l �������� �������.')
						wait(2000)
						sampSendChat('/me �������� ����� �� ��������������� �����')
						wait(2000)
						sampSendChat('/me �������� ����� �� ����')
						wait(500)
						sampSendChat('/time')
					elseif result and list == 3 and button == 1 then
						sampSendChat('/do �� ����� ���������� �����.')
						wait(2000)
						sampSendChat('/me ������ ��������� ���� ���� ����� � �������')
						wait(2000)
						sampSendChat('/do ����� � �����.')
						wait(2000)
						sampSendChat('/me �������� ����� �� ��������������� �������')
						wait(2000)
						sampSendChat('/l ������� �������.')
						wait(2000)
						sampSendChat('/gnews HLV � ���������, ��� �������� ������������� � �������� �. ���-��������.')
						wait(2000)
						sampSendChat('/l �������� �������.')
						wait(2000)
						sampSendChat('/me �������� ����� �� ��������������� �����')
						wait(2000)
						sampSendChat('/me �������� ����� �� ����')
						wait(500)
						sampSendChat('/time')
					elseif result and list == 4 and button == 1 then
						sampSendChat('/do �� ����� ���������� �����.')
						wait(2000)
						sampSendChat('/me ������ ��������� ���� ���� ����� � �������')
						wait(2000)
						sampSendChat('/do ����� � �����.')
						wait(2000)
						sampSendChat('/me �������� ����� �� ��������������� �������')
						wait(2000)
						sampSendChat('/l ������� �������.')
						wait(2000)
						sampSendChat('/gnews HLV � ���������, ��� �������� ������������� � �������� �. ���-��������.')
						wait(2000)
						sampSendChat('/l �������� �������.')
						wait(2000)
						sampSendChat('/me �������� ����� �� ��������������� �����')
						wait(2000)
						sampSendChat('/me �������� ����� �� ����')
						wait(500)
						sampSendChat('/time')
					elseif result and list == 5 and button == 1 then
						sampSendChat('/do �� ����� ���������� �����.')
						wait(2000)
						sampSendChat('/me ������ ��������� ���� ���� ����� � �������')
						wait(2000)
						sampSendChat('/do ����� � �����.')
						wait(2000)
						sampSendChat('/me �������� ����� �� ��������������� �������')
						wait(2000)
						sampSendChat('/l ������� �������.')
						wait(2000)
						sampSendChat('/gnews HLV � ���������, ��� �������� ������������� � �������� �. ���-��������.')
						wait(2000)
						sampSendChat('/l �������� �������.')
						wait(2000)
						sampSendChat('/me �������� ����� �� ��������������� �����')
						wait(2000)
						sampSendChat('/me �������� ����� �� ����')
						wait(500)
						sampSendChat('/time')
						end
						end
		elseif result and list == 3 and button == 1 then
		sampShowDialog(28173, '{FFE599}���������� � �������', '{5A90CE}� �� ���������{FFFFFF} - Medical Helper v 0.1\n{5A90CE}� ����� �������{FFFFFF} - ������ �����\n{5A90CE}� �������� ����������{FFFFFF} - /mc\n{5A90CE}� �������� ���� ��{FFFFFF} Diamond Role Play', '�������', '', 0)
				end
			end
		end

function cmd_minsp()
	sampShowDialog(15445, '{FFE599}������ ���. �����', '{FFFFFF}������� {5A90CE}ID{FFFFFF} ��������', '�������', '������',1)
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
			
	sampSendChat('�������� ���������� ��� �������.')
	wait(2000)
	sampSendChat('/n /pass ' .. id .. '')
	wait(500)
	
			sampAddChatMessage('{FFFFFF}�������: {008000}1 {FFFFFF}- ���������� | {FF0000}2 {FFFFFF}- ������', white_color)
			while not isKeyDown(VK_1) do
			wait(0)
			if isKeyDown(VK_2) then
			sampSendChat('��...')
			return
			end
			end
		
	sampSendChat('/do � ���. ����� ����� ��� ���������� ���. �����.')
	wait(2000)
	sampSendChat('/me ������ �������� � ����� ��� �� ���� ��������')
	wait(2000)
	sampSendChat('/do �������� ������� �������� - 120 �� 70.')
	wait(2000)
	sampSendChat('/me ������� ����� ��������')
	wait(2000)
	sampSendChat('/do ����� � �����.')
	wait(2000)
	sampSendChat('/me ������ ����� ��� ���������� ���. �����')
	wait(2000)
	sampSendChat('/me ������ �����, ����� ���-�� ������� � ���, ����� ���� �������� ������ �������.')
	wait(2000)
	sampSendChat('/me �������� ������ �Ministry Of Health�')
	wait(2000)
	sampSendChat('/do ���. ����� ������.')
	wait(2000)
	sampSendChat('/me ������� ���. ����� �������� ��������')
	wait(2000)
	sampSendChat('/medcard ' .. PID .. "")
	wait(500)
	sampSendChat('/time')
	end
	end
end

function cmd_minject()
	sampShowDialog(15446, '{FFE599}������� ����', '{FFFFFF}������� {5A90CE}ID{FFFFFF} ��������', '�������', '������',1)
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
			
	sampSendChat('/do �� ����� �����,������ � ���������� � ������� �� �������.')
	wait(2000)
	sampSendChat('/me ���� �� ����� ����� � ������ � ����������')
	wait(2000)
	sampSendChat('/me ���� ����� � �����')
	wait(2000)
	sampSendChat('/me ������ ����� �������')
	wait(2000)
	sampSendChat('/me ������ ������ ����� ���� ��������')
	wait(2000)
	sampSendChat('/me ������ ����� ����')
	wait(2000)
	sampSendChat('/me ������ ����')
	wait(2000)
	sampSendChat('/inject ' .. PID .. '')
	wait(2000)
	sampSendChat('/me �������� ����� � ����� �����')
	wait(2000)
	sampSendChat('�������� ������ ����� � ������� �� � ������� ������ �����.')
	wait(500)
	sampSendChat('/time')
	end
	end
end

function cmd_moperation()
	lua_thread.create(moperation)
end

function moperation()
	sampSendChat('/do � ���. ����� ����� ��������� ������� ��� ���.')
	wait(2000)
	sampSendChat('/me ��������������� ���� ��������� ���������')
	wait(2000)
	sampSendChat('/me ����� �� ���� ��������')
	wait(2000)
	sampSendChat('/me ���� � ���� ����������� ����� � ��������')
	wait(2000)
	sampSendChat('/do ����� �������� ��������.')
	wait(2000)
	sampSendChat('/me ������ ����� � ���� ��������')
	wait(2000)
	sampSendChat('/me ����� ������� �������� ��� �������� ��������')
	wait(2000)
	sampSendChat('/do ������� �������� ��������.')
	wait(2000)
	sampSendChat('/do ������� ������ � ����.')
	wait(500)
	sampSendChat('/time')
	end

function cmd_mvac()
	sampShowDialog(15448, '{FFE599}�������� ����������', '{FFFFFF}������� {5A90CE}ID{FFFFFF} ��������', '�������', '������',1)
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
			
	sampSendChat('����� ���������� ���� ����.')
	wait(500)
	
			sampAddChatMessage('{FFFFFF}�������: {008000}1 {FFFFFF}- �� ������ | {008000}2 {FFFFFF}- �� ������', white_color)
			sampAddChatMessage('{FFFFFF}�������: {008000}3 {FFFFFF}- �� �������� | {008000}4 {FFFFFF}- �� �����', white_color)
			while not isKeyDown(VK_1) do
			wait(0)
			if isKeyDown(VK_2) then
				sampSendChat('/do �� ����� �����,������ � ���������� � ������� �� �������.')
				wait(2000)
				sampSendChat('/me ���� �� ����� ����� � ������ � �������� �� ��������')
				wait(2000)
				sampSendChat('/me ���� ����� � �����')
				wait(2000)
				sampSendChat('/me ������ ����� �������')
				wait(2000)
				sampSendChat('/me ������ ������ ����� ���� ��������')
				wait(2000)
				sampSendChat('/me ������ ����� ����')
				wait(2000)
				sampSendChat('/me ������ ����')
				wait(2000)
				sampSendChat('/me �������� ����� � ����� �����')
				wait(2000)
				sampSendChat('�������� ������ ����� � ������� �� � ������� ������ �����.')
				wait(2000)
				sampSendChat('/vac ' .. PID .. ' 2 650')
				wait(500)
				sampSendChat('/time')
			return
			elseif isKeyDown(VK_3) then
				sampSendChat('/do �� ����� �����,������ � ���������� � ������� �� �������.')
				wait(2000)
				sampSendChat('/me ���� �� ����� ����� � ������ � �������� �� ���������')
				wait(2000)
				sampSendChat('/me ���� ����� � �����')
				wait(2000)
				sampSendChat('/me ������ ����� �������')
				wait(2000)
				sampSendChat('/me ������ ������ ����� ���� ��������')
				wait(2000)
				sampSendChat('/me ������ ����� ����')
				wait(2000)
				sampSendChat('/me ������ ����')
				wait(2000)
				sampSendChat('/me �������� ����� � ����� �����')
				wait(2000)
				sampSendChat('�������� ������ ����� � ������� �� � ������� ������ �����.')
				wait(2000)
				sampSendChat('/vac ' .. PID .. ' 3 750')
				wait(500)
				sampSendChat('/time')
			return
			elseif isKeyDown(VK_4) then
				sampSendChat('/do �� ����� �����,������ � ���������� � ������� �� �������.')
				wait(2000)
				sampSendChat('/me ���� �� ����� ����� � ������ � �������� �� �������')
				wait(2000)
				sampSendChat('/me ���� ����� � �����')
				wait(2000)
				sampSendChat('/me ������ ����� �������')
				wait(2000)
				sampSendChat('/me ������ ������ ����� ���� ��������')
				wait(2000)
				sampSendChat('/me ������ ����� ����')
				wait(2000)
				sampSendChat('/me ������ ����')
				wait(2000)
				sampSendChat('/me �������� ����� � ����� �����')
				wait(2000)
				sampSendChat('�������� ������ ����� � ������� �� � ������� ������ �����.')
				wait(2000)
				sampSendChat('/vac ' .. PID .. ' 4 850')
				wait(500)
				sampSendChat('/time')
			return
			end
			end
		
	sampSendChat('/do �� ����� �����,������ � ���������� � ������� �� �������.')
	wait(2000)
	sampSendChat('/me ���� �� ����� ����� � ������ � �������� �� �������')
	wait(2000)
	sampSendChat('/me ���� ����� � �����')
	wait(2000)
	sampSendChat('/me ������ ����� �������')
	wait(2000)
	sampSendChat('/me ������ ������ ����� ���� ��������')
	wait(2000)
	sampSendChat('/me ������ ����� ����')
	wait(2000)
	sampSendChat('/me ������ ����')
	wait(2000)
	sampSendChat('/me �������� ����� � ����� �����')
	wait(2000)
	sampSendChat('�������� ������ ����� � ������� �� � ������� ������ �����.')
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
	sampSendChat('������� ���������, ������ ���������, ������ � ��������, ����� ������ � ��������.')
	wait(2000)
	sampSendChat('C������ ���������� ���� ���������� ��������� ������� � ����� ����������.')
	wait(2000)
	sampSendChat('�������� � ��� ������ ���������� � � ������ ���������� �������� ��� � ��� ������.')
	wait(2000)
	sampSendChat('����� � ��������� ���� � ��������� ���� ����� � ���� ���������.')
	wait(2000)
	sampSendChat('���, �������� ������������ ������.')
	wait(2000)
	sampSendChat('�� ����� ���� ������� � ����� � � ��������� � ����� � ���� ����� �� ������ �������.')
	wait(2000)
	sampSendChat('������������� �� � ������� ������ ������ �� ����� �������� �����!')
	wait(500)
	sampSendChat('/time')
	end

function cmd_msex()
	sampShowDialog(15449, '{FFE599}�������� �� ����� ����', '{FFFFFF}������� {5A90CE}ID{FFFFFF} ��������', '�������', '������',1)
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
	
	sampSendChat('������������ ����������.')
	wait(500)
	
			sampAddChatMessage('{FFFFFF}�������: {008000}1 {FFFFFF}- ������� �� ���. | {008000}2 {FFFFFF}- ������� �� ���.', white_color)
			while not isKeyDown(VK_1) do
			wait(0)
			if isKeyDown(VK_2) then
				sampSendChat('/me ����� ��������')
				wait(2000)
				sampSendChat('/me ����� ����� ��� ������� ��������')
				wait(2000)
				sampSendChat('/me ������� ������� ��� �������')
				wait(2000)
				sampSendChat('/do ������� ������.')
				wait(2000)
				sampSendChat('/me ���� ��������� ������ ������')
				wait(2000)
				sampSendChat('/me ������ ��� ��������')
				wait(2000)
				sampSendChat('/me ���� ���.����� � ���� ������� ���')
				wait(2000)
				sampSendChat('/me ���� ����� ������� ���')
				wait(2000)
				sampSendChat('/me �������� ������� ��� �������')
				wait(2000)
				sampSendChat('/me ���� ����� ��� ������� � ��������')
				wait(2000)
				sampSendChat('/do ������� ���������.')
				wait(2000)
				sampSendChat('/setsex ' .. PID .. ' 2')
				wait(500)
				sampSendChat('/time')
			return
			end
			end
			
	sampSendChat('/me ����� ��������')
	wait(2000)
	sampSendChat('/me ����� ����� ��� ������� ��������')
	wait(2000)
	sampSendChat('/me ������� ������� ��� �������')
	wait(2000)
	sampSendChat('/do ������� ������.')
	wait(2000)
	sampSendChat('/me ���� ��������� ������ ������')
	wait(2000)
	sampSendChat('/me ������ ��� ��������')
	wait(2000)
	sampSendChat('/me ���� ���.����� � ���� ������� ���')
	wait(2000)
	sampSendChat('/me ���� ����� ������� ���')
	wait(2000)
	sampSendChat('/me �������� ������� ��� �������')
	wait(2000)
	sampSendChat('/me ���� ����� ��� ������� � ��������')
	wait(2000)
	sampSendChat('/do ������� ���������.')
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
	sampSendChat('/me ������ �������� � ����� ��� �� ���� ��������')
	wait(2000)
	sampSendChat('/do �������� ������� �������� - 120 �� 70.')
	wait(2000)
	sampSendChat('/me ������� ����� ��������')
	wait(2000)
	sampSendChat('/do ����� � �����.')
	wait(2000)
	sampSendChat('/me ������ �����, ����� ���-�� ������� � ���, ����� ���� �������� ������ �������.')
	wait(2000)
	sampSendChat('/me �������� ������ �Ministry Of Health�')
	wait(500)
	sampSendChat('/time')
	end

function cmd_minvite()
	sampShowDialog(15450, '{FFE599}������� �� �������', '{FFFFFF}������� {5A90CE}ID{FFFFFF} ����������', '�������', '������',1)
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
			
	sampSendChat('��� ������� ����������.')
	wait(500)
	
			sampAddChatMessage('{FFFFFF}�������: {008000}1 {FFFFFF}- ���������� | {FF0000}2 {FFFFFF}- ������', white_color)
			while not isKeyDown(VK_1) do
			wait(0)
			if isKeyDown(VK_2) then
			sampSendChat('��...')
			return
			end
			end
	sampSendChat('/me ������ �������, ����� ���� ����� � ������ ������������� ����������������')
	wait(2000)
	sampSendChat('/me ����� � ������ �����������, ���� ������ � �������� � ����� ����������')
	wait(2000)
	sampSendChat('/do �� ������ ������� ��������.')
	wait(2000)
	sampSendChat('/do � ��������� ����� ������ �������� � ������.')
	wait(2000)
	sampSendChat('/me ��������� ����� ���� ��������� �������� � ������ �����')
	wait(2000)
	sampSendChat('/todo �������.*��������� ����� ��������')
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
	sampShowDialog(15451, '{FFE599}����������', '{FFFFFF}������� {5A90CE}ID{FFFFFF} ����������', '�������', '������',1)
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
			
			sampShowDialog(15452, '{FFE599}����������', '{FFFFFF}������� {5A90CE}�������{FFFFFF} ����������\n\n{5A90CE}������: {FFFFFF}LS | �� ������������ �������.', '�������', '������',1)
			repeat
			wait(0)
			re, button, list, input = sampHasDialogRespond(15452)
			until re
			
			if re and input and button == 1 then
			PRICHINA = input:match('(.+)')
		
	sampSendChat('/me ������ �������, ����� ���� ����� � ������ ������������� ����������������')
	wait(2000)
	sampSendChat('/me ����� � ������ �����������, ���� ������ � �������� � ����� ���������')
	wait(2000)
	sampSendChat('/do �� ������ ������� ��������.')
	wait(2000)
	sampSendChat('/uninvite ' .. PID .. ' ' .. PRICHINA .. '')
	wait(500)
	sampSendChat('/time')
			end		
		end
	end
end

function cmd_moffuninvite()
	sampShowDialog(15452, '{FFE599}���������� � ����', '{FFFFFF}������� {5A90CE}Nick_Name{FFFFFF} ����������', '�������', '������',1)
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
			
			sampShowDialog(15453, '{FFE599}���������� � ����', '{FFFFFF}������� {5A90CE}�������{FFFFFF} ����������\n\n{5A90CE}������: {FFFFFF}LS | �� ������������ �������.', '�������', '������',1)
			repeat
			wait(0)
			re, button, list, input = sampHasDialogRespond(15453)
			until re
			
			if re and input and button == 1 then
			PRICHINA = input:match('(.+)')
		
	sampSendChat('/me ������ �������, ����� ���� ����� � ������ ������������� ����������������')
	wait(2000)
	sampSendChat('/me ����� � ������ �����������, ���� ������ � �������� � ����� ���������')
	wait(2000)
	sampSendChat('/do �� ������ ������� ��������.')
	wait(2000)
	sampSendChat('/uninviteoff ' .. PID .. ' ' .. PRICHINA .. '')
	wait(500)
	sampSendChat('/time')
			end		
		end
	end
end
	

function cmd_mrang()
	sampShowDialog(15453, '{FFE599}��������/��������', '{FFFFFF}������� {5A90CE}ID{FFFFFF} ����������', '�������', '������',1)
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
		
	sampSendChat('/me ������ �������, ����� ���� ����� � ������ ������������� ����������������')
	wait(2000)
	sampSendChat('/me ����� � ������ ���������� �����������, ����� �������� � ����� ����������')
	wait(2000)
	sampSendChat('/do �� ������ ������� ��������.')
	wait(500)
	sampSendChat('/time')
	wait(500)
	sampSendChat('/rang ' .. PID .. '')
			end		
		end
	end

function cmd_mwarn()
	sampShowDialog(15454, '{FFE599}������ �������', '{FFFFFF}������� {5A90CE}ID{FFFFFF} ����������', '�������', '������',1)
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
			
			sampShowDialog(15455, '{FFE599}������ �������', '{FFFFFF}������� {5A90CE}�������{FFFFFF} ��������\n\n{5A90CE}������: {FFFFFF}LS | ��������� ������.', '�������', '������',1)
			repeat
			wait(0)
			re, button, list, input = sampHasDialogRespond(15455)
			until re
			
			if re and input and button == 1 then
			PRICHINA = input:match('(.+)')
		
	sampSendChat('/me ������ �������, ����� ���� ����� � ������ ������������� ����������������')
	wait(2000)
	sampSendChat('/me ����� � ������ ���������� �����������, ����� �������� � ����� ����������')
	wait(2000)
	sampSendChat('/do �� ������ ������� ��������.')
	wait(500)
	sampSendChat('/time')
	wait(500)
	sampSendChat('/fwarn ' .. PID .. ' ' .. PRICHINA .. '')
			end		
		end
	end
end

function cmd_moffwarn()
	sampShowDialog(15455, '{FFE599}������ ������� � ����', '{FFFFFF}������� {5A90CE}Nick_Name{FFFFFF} ����������', '�������', '������',1)
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
			
			sampShowDialog(15456, '{FFE599}������ ������� � ����', '{FFFFFF}������� {5A90CE}�������{FFFFFF} ��������\n\n{5A90CE}������: {FFFFFF}LS | ��������� ������.', '�������', '������',1)
			repeat
			wait(0)
			re, button, list, input = sampHasDialogRespond(15456)
			until re
			
			if re and input and button == 1 then
			PRICHINA = input:match('(.+)')
		
	sampSendChat('/me ������ �������, ����� ���� ����� � ������ ������������� ����������������')
	wait(2000)
	sampSendChat('/me ����� � ������ ���������� �����������, ����� �������� � ����� ����������')
	wait(2000)
	sampSendChat('/do �� ������ ������� ��������.')
	wait(500)
	sampSendChat('/time')
	wait(500)
	sampSendChat('/fwarnoff ' .. PID .. ' ' .. PRICHINA .. '')
			end		
		end
	end
end

function cmd_munwarn()
	sampShowDialog(15456, '{FFE599}����� �������', '{FFFFFF}������� {5A90CE}ID{FFFFFF} ����������', '�������', '������',1)
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
			
			sampShowDialog(15457, '{FFE599}����� �������', '{FFFFFF}������� {5A90CE}�������{FFFFFF} ������ ��������\n\n{5A90CE}������: {FFFFFF}LS | ���������.', '�������', '������',1)
			repeat
			wait(0)
			re, button, list, input = sampHasDialogRespond(15457)
			until re
			
			if re and input and button == 1 then
			PRICHINA = input:match('(.+)')
		
	sampSendChat('/me ������ �������, ����� ���� ����� � ������ ������������� ����������������')
	wait(2000)
	sampSendChat('/me ����� � ������ ���������� �����������, ����� �������� � ����� ����������')
	wait(2000)
	sampSendChat('/do �� ������ ������� ��������.')
	wait(500)
	sampSendChat('/time')
	wait(500)
	sampSendChat('/unfwarn ' .. PID .. ' ' .. PRICHINA .. '')
			end		
		end
	end
end

function cmd_mskin()
	sampShowDialog(15457, '{FFE599}������� �����', '{FFFFFF}������� {5A90CE}ID{FFFFFF} ����������', '�������', '������',1)
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
		
	sampSendChat('/do � ��������� ����� �������� � ������ ������.')
	wait(2000)
	sampSendChat('/me ��������� ����� ��������� �������� � ������ �����')
	wait(2000)
	sampSendChat('/todo �������.*��������� �������� �������� ��������')
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
		
	sampSendChat('/do � ��������� ����� �������� � ������ ������.')
	wait(2000)
	sampSendChat('/me ��������� ����� ��������� �������� � ������ �����')
	wait(2000)
	sampSendChat('/me ������������� � ����� �����')
	wait(2000)
	sampSendChat('/do �������...')
	wait(2000)
	sampSendChat('/me ���������� � ������� ������ ����� � ��������')
	wait(2000)
	sampSendChat('/anim 2 8')
	wait(500)
	sampSendChat('/setskin ' .. id .. '')
	
end

function cmd_mordermed()
	sampShowDialog(15458, '{FFE599}����� ������������', '{FFFFFF}������� {5A90CE}���-��{FFFFFF} ������������\n\n������ ������ - {008000}1000$', '�������', '������',1)
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
		
	sampSendChat('/do �� ����� ����� ������������ ���������.')
	wait(2000)
	sampSendChat('/me ������ ����� ���� �����')
	wait(2000)
	sampSendChat('/me ����� �� ���� ������ �ǻ � ������� �' .. PID .. '� ������������')
	wait(2000)
	sampSendChat('/me ����� �� ������ �������������')
	wait(2000)
	sampSendChat('/do �� ������ ������� ��������')
	wait(500)
	sampSendChat('/time')
	end
	end
end

function cmd_mawardall()
	sampShowDialog(15459, '{FFE599}������ ���� �����������', '{FFFFFF}������� {5A90CE}�����{FFFFFF} ������\n\n������ ������ - {008000}100$ {FFFFFF}� ������ - {008000}3000$', '�������', '������',1)
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
		
	sampSendChat('/do �� ����� ����� ������������ ���������.')
	wait(2000)
	sampSendChat('/me ������ ����� ���� �����')
	wait(2000)
	sampSendChat('/me ����� �� ���� ������� �ǻ � ����� �' .. PID .. '$� ���� �����������')
	wait(2000)
	sampSendChat('/me ����� �� ������ �������������')
	wait(2000)
	sampSendChat('/do �� ������ ������� ��������')
	wait(500)
	sampSendChat('/time')
	end
	end
end

function cmd_mawardone()
	sampShowDialog(15460, '{FFE599}������ ������ ����������', '{FFFFFF}������� {5A90CE}�����{FFFFFF} ������\n\n������ ������ - {008000}100$ {FFFFFF}� ������ - {008000}9000$', '�������', '������',1)
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
		
	sampSendChat('/do �� ����� ����� ������������ ���������.')
	wait(2000)
	sampSendChat('/me ������ ����� ���� �����')
	wait(2000)
	sampSendChat('/me ����� �� ���� ������� �ǻ � ����� �' .. PID .. '$� ����������')
	wait(2000)
	sampSendChat('/me ����� �� ������ �������������')
	wait(2000)
	sampSendChat('/do �� ������ ������� ��������')
	wait(500)
	sampSendChat('/time')
	end
	end
end

function cmd_maward()
	sampShowDialog(15461, '{FFE599}������ ���� ���������', '{FFFFFF}������� {5A90CE}�����{FFFFFF} ������\n\n������ ������ - {008000}100$ {FFFFFF}� ������ - {008000}9000$', '�������', '������',1)
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
		
	sampSendChat('/do �� ����� ����� ������������ ���������.')
	wait(2000)
	sampSendChat('/me ������ ����� ���� �����')
	wait(2000)
	sampSendChat('/me ����� �� ���� ������� �ǻ � ����� �' .. PID .. '$� ������ ��������')
	wait(2000)
	sampSendChat('/me ����� �� ������ �������������')
	wait(2000)
	sampSendChat('/do �� ������ ������� ��������')
	wait(500)
	sampSendChat('/time')
	end
	end
end

function cmd_sobes()
	sampShowDialog(15462, '{FFE599}�������������', '{FFFFFF}������� {5A90CE}ID{FFFFFF} ����������', '�������', '������',1)
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
			
	sampSendChat('������������, �� �� �������������?')
	wait(500)
	
			sampAddChatMessage('{FFFFFF}�������: {008000}1 {FFFFFF}- ���������� | {FF0000}2 {FFFFFF}- ������', white_color)
			while not isKeyDown(VK_1) do
			wait(0)
			if isKeyDown(VK_2) then
			sampSendChat('��...')
			return
			end
			end
		
	sampSendChat('������, ������������� ����������.')
	wait(2000)
	sampSendChat('/n ��� �������')
	wait(500)
	
			sampAddChatMessage('{FFFFFF}�������: {008000}1 {FFFFFF}- ���������� | {FF0000}2 {FFFFFF}- ������', white_color)
			while not isKeyDown(VK_1) do
			wait(0)
			if isKeyDown(VK_2) then
			sampSendChat('��...')
			return
			end
			end
	
	sampSendChat('������, ��������� ���� ����������.')
	wait(2000)
	sampSendChat('/n /pass ' .. id .. ' | /lic ' .. id .. ' | /med ' .. id .. '')
	wait(500)
			
			sampAddChatMessage('{FFFFFF}��������: {008000}3 ��� {FFFFFF}| {008000}18 ������� {FFFFFF}| {008000}����� �� �� {FFFFFF}| {008000}���. �����', white_color)
			sampAddChatMessage('{FFFFFF}�������: {008000}1 {FFFFFF}- ���������� | {FF0000}2 {FFFFFF}- ������', white_color)
			while not isKeyDown(VK_1) do
			wait(0)
			if isKeyDown(VK_2) then
			sampSendChat('��...')
			return
			end
			
			end
	sampSendChat('�������, ������ � ��� ����� ��������� ��������.')
	wait(2000)
	sampSendChat('������: ��� � ���� ��� �������?')
	wait(500)
	
			sampAddChatMessage('{FFFFFF}�������: {008000}1 {FFFFFF}- ���������� | {FF0000}2 {FFFFFF}- ������', white_color)
			while not isKeyDown(VK_1) do
			wait(0)
			if isKeyDown(VK_2) then
			sampSendChat('��...')
			return
			end
			end
	
	sampSendChat('������: ������ ����� � ���� ���?')
	wait(500)
	
			sampAddChatMessage('{FFFFFF}�������: {008000}1 {FFFFFF}- ���������� | {FF0000}2 {FFFFFF}- ������', white_color)
			while not isKeyDown(VK_1) do
			wait(0)
			if isKeyDown(VK_2) then
			sampSendChat('��...')
			return
			end
			end
	
	sampSendChat('���������: ��� �����, �� ������ ������ - ��, ��, ��?')
	wait(500)
	
			sampAddChatMessage('{FFFFFF}�������: {008000}1 {FFFFFF}- ���������� | {FF0000}2 {FFFFFF}- ������', white_color)
			while not isKeyDown(VK_1) do
			wait(0)
			if isKeyDown(VK_2) then
			sampSendChat('��...')
			return
			end
			end
	
	sampSendChat('�������, ����� �� ��� ���������.')
	wait(2000)
	sampSendChat('/r ��������� � ������� �������� ' .. PID .. " ������ �������������.")
	wait(500)
	sampSendChat('/time')
	end
	end
end

--[[ �������. ��� ����������� ���������� ����

	sampSendChat('����� ���������')
		sampAddChatMessage('{FFFFFF}�������: {008000}1 {FFFFFF}- ���������� | {FF0000}2 {FFFFFF}- ������', white_color)
		while not isKeyDown(VK_1) do
		wait(0)
		if isKeyDown(VK_2) then
		sampSendChat('��...')
		return
		end
		end
	sampSendChat('�������, ��� �� ����')
	
]]--