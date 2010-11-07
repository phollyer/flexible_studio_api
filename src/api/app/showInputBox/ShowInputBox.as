package api.app.showInputBox
{
	import flash.events.IEventDispatcher;
	
	import api.app.App;
	
	import api.events.app.showInputBox.ShowInputBoxEvent;
	
	[Event(name="missingPrompt" , type="api.events.SWFStudioEvent")]
	[Event(name="result", type="api.events.app.showInputBox.ShowInputBoxEvent")]
	[Bindable]
	public class ShowInputBox extends App
	{
		// Required
		public var prompt:String = null;
		
		// Optional
		public var text:String = null;
		public var title:String = null;
		
		public function ShowInputBox(target:IEventDispatcher=null)
		{
			super(target);
		}
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