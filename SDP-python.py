from math import log

# Returns the prediction of the SDP model for a given item in a given menu with a given selection history

def SDP_selectiontime (menulength, itemposition, trials, p_i):
	# menulength = the number of items in the menu
	# itemposition = position of the to-be-clicked target item in the menu (1 = first)
	# trials = total number of previous repetitions the user has carried out with this menu
	# probability of this item in the selection history (see slides / paper)

	a_pi = 0.37
	b_pi = 0.13
	a_vs = 0.30
	b_vs = 0.08
	b_hh = 0.08
	a_hh = 0.24
	item_height = 22 		# 22 in pixels 
	L = 1				# L=1 means static, immutable menus

	t_pi = a_pi + b_pi * log((item_height * itemposition)/item_height+1,2)
	e_i = L * (1-1/trials)
	t_vsi =  b_vs * menulength + a_vs
	Hi = log(1/p_i,2)
	t_hhi = b_hh * Hi + a_hh
	t_dsi = (1 - e_i) * t_vsi + e_i * t_hhi
	return t_dsi + t_pi