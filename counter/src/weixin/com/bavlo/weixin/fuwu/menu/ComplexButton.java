package com.bavlo.weixin.fuwu.menu;

/**
 * 复合类型的按钮
 * 
 * @author shijf
 */
public class ComplexButton extends Button {
	private Button[] sub_button;
	private Button button;

	public Button getButton() {
		return button;
	}

	public void setButton(Button button) {
		this.button = button;
	}

	public Button[] getSub_button() {
		return sub_button;
	}

	public void setSub_button(Button[] sub_button) {
		this.sub_button = sub_button;
	}
}
