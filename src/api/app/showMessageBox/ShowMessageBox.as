package api.app.showMessageBox
{
	import flash.events.IEventDispatcher;
	
	import api.app.App;
	
	import api.events.app.showMessageBox.ShowMessageBoxEvent;
	import api.vos.app.showMessageBox.ShowMessageBoxVO;

	[Event(name="missingPrompt" , type="api.events.SWFStudioEvent")]
	/**
	 * Dispatched when the Results are ready.
	 *
	 * @eventType api.events.app.ShowMessageBox.Event.RESULT
	 */
	[Event(name="result", type="api.events.app.showMessageBox.ShowMessageBoxEvent")]
	[Bindable]
	/**
	 *
	 *
	 * @see http://www.northcode.com/v3/help/index.html?page=ssCore_App_showMsgBox.html Northcode Help Documentation
	 */
	public class ShowMessageBox extends App
	{
		// Required
		/**
		 * 
		 *
		 * @defaultValue <code>new</code>
		 */
		public var messageBox:ShowMessageBoxVO = new ShowMessageBoxVO();
		
		// Result
		/**
		 * 
		 *
		 * @defaultValue <code>null</code>
		 */
		public var selectedButton:String = null;
		
		/**
		 * Constructor for App.ShowMessageBox()
		 *
                 * @see http://www.northcode.com/v3/help/index.html?page=ssCore_App_showMsgBox.html Northcode Help Documentation
		 */
		public function ShowMessageBox(target:IEventDispatcher=null)
		{
			super(target);
		}
		/**
		 *
		 *
                 *
		 * @param messageBoxOBJ
                 *
                 * @see http://www.northcode.com/v3/help/index.html?page=ssCore_App_showMsgBox.html Northcode Help Documentation
		 */
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
		/**
		* A result has been received so dispatch it.
		*
		* @param r The result Object returned by SWF Studio.
		*
		* @private
		*/
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