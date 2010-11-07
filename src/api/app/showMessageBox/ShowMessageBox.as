package api.app.showMessageBox
{
	import flash.events.IEventDispatcher;
	
	import api.app.App;
	
	import api.events.app.showMessageBox.ShowMessageBoxEvent;
	import api.vos.app.showMessageBox.ShowMessageBoxVO;

	[Event(name="missingPrompt" , type="api.events.SWFStudioEvent")]
	[Event(name="result", type="api.events.app.showMessageBox.ShowMessageBoxEvent")]
	[Bindable]
	public class ShowMessageBox extends App
	{
		// Required
		public var messageBox:ShowMessageBoxVO = new ShowMessageBoxVO();
		
		// Result
		public var selectedButton:String = null;
		
		public function ShowMessageBox(target:IEventDispatcher=null)
		{
			super(target);
		}
		public function showMessageBox( messageBoxOBJ:ShowMessageBoxVO = null ):void
		{
			messageBox = compare( messageBoxOBJ , messageBox );
			switch( messageBox.prompt )
			{
				case null:
					missingPrompt();
					break;
				default:
					ssCore.App.showMsgBox( setMsgBoxProps() , {callback:actionComplete, errorSTR:"showMessageBoxError", code:"8005"} );
			}
		}
		override protected function sendResult( r:Object ):void
		{
			selectedButton = r.result;
			var e : ShowMessageBoxEvent = new ShowMessageBoxEvent( ShowMessageBoxEvent.RESULT );
			e.selectedButton = selectedButton;
			dispatchEvent( e );
		}
		private function compare( first:ShowMessageBoxVO , second:ShowMessageBoxVO ):ShowMessageBoxVO
		{
			switch( first != null )
			{
				case true:
					second = first;
			}
			return second;
		}
		private function setMsgBoxProps():Object 
		{
			var __o : Object = new Object();
			__o.prompt = messageBox.prompt;
			
			switch( messageBox.buttons != null )
			{
				case true:
					__o.buttons = messageBox.buttons;
			}
			switch( messageBox.defaultButton != null )
			{
				case true:
					__o.defaultButton = messageBox.defaultButton;
			}
			switch( messageBox.icon != null )
			{
				case true:
					__o.icon = messageBox.icon;
			}
			switch( messageBox.title != null )
			{
				case true:
					__o.title = messageBox.title;
			}
			return __o;
		}
	}
}