package api.app.showInputBox
{
	import api.app.App;

	import api.events.app.showInputBox.ShowInputBoxEvent;

	import flash.events.IEventDispatcher;
	
	/**
	* Dispatched if the Property <code>prompt</code> has not been supplied.
	*
	* @eventType api.events.SWFStudioEvent.MISSING_PROMPT
	*/
	[Event(name="missingPrompt" , type="api.events.SWFStudioEvent")]
	/**
	* Dispatched when the Results are ready.
	*
	* @eventType api.events.app.showInputBox.ShowInputBoxEvent.RESULT
	*/
	[Event(name="result", type="api.events.app.showInputBox.ShowInputBoxEvent")]
	[Bindable]
	/**
	*
	*
	* @see http://www.northcode.com/v3/help/index.html?page=ssCore_App_showInputBox.html Northcode Help Documentation
	*/
	public class ShowInputBox extends App
	{
		// Required
		/**
		* 
		*
		* @defaultValue <code>null</code>
		*/
		public var prompt:String = null;
		
		// Optional
		/**
		* 
		*
		* @defaultValue <code>null</code>
		*/
		public var text:String = null;
		/**
		* 
		*
		* @defaultValue <code>null</code>
		*/
		public var title:String = null;
		
		/**
		* Constructor for App.ShowInputBox()
		*
		* @see http://www.northcode.com/v3/help/index.html?page=ssCore_App_showInputBox.html Northcode Help Documentation
		*/
		public function ShowInputBox(target:IEventDispatcher=null)
		{
			super(target);
		}
		/**
		*
		*
		*
		* @param boxPrompt
		*
		* @see http://www.northcode.com/v3/help/index.html?page=ssCore_App_showInputBox.html Northcode Help Documentation
		*/
		public function showInputBox( boxPrompt:String = null ):void
		{
			prompt = compareStrings( boxPrompt , prompt );
			switch( prompt )
			{
				case null:
					missingPrompt();
					break;
				case false:
					var __o : Object = setInputBoxProps();
					ssCore.App.showFolderBrowser( __o , {callback:actionComplete, errorSTR:"showInputBoxError", code:"8020"} );
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
			var e : ShowInputBoxEvent = new ShowInputBoxEvent( ShowInputBoxEvent.RESULT );
			e.text = r.result;
			dispatchEvent( e );
		}
		private function setInputBoxProps():Object
		{
			var __o : Object = new Object();
			__o.prompt = prompt;
			switch( text != null )
			{
				case true:
					__o.text = text;
			}
			switch( title != null )
			{
				case true:
					__o.title = title;
			}
			return __o;
		}
	}
}