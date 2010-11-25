package api.script.addCode
{
	import flash.events.IEventDispatcher;
	
	
	import api.events.script.addCode.AddCodeEvent;
	import api.script.Script;

	[Event(name="missingModule" , type="api.events.SWFStudioEvent")]
	[Event(name="result", type="api.events.script.addCode.AddCodeEvent")]
	[Bindable]
	public class AddCode extends Script
	{
		// Optional
		public var code:String = null;
		
		// Required
		public var module:String = null;
		
		// Result
		public var scriptError:String = null;
		
		public function AddCode(target:IEventDispatcher=null)
		{
			super(target);
		}
		public function addCode( moduleName:String = null ):void
		{
			module = compareStrings( moduleName , module );
			
			switch( module )
			{
				case null:
					missingModule();
					break;
				default:
					var __o:Object = new Object();
					__o.module = module;
					switch( code != null )
					{
						case true:
							__o.code = code;
					}
					ssCore.Script.addCode( __o
										 ,{callback:actionComplete, errorSTR:"addCodeError", code:"35000"} );
			}
		}
		override protected function sendResult( r:Object ):void
		{
			scriptError = r.scriptError;
			
			var e : AddCodeEvent = new AddCodeEvent( AddCodeEvent.RESULT );
			e.scriptError = scriptError;
			dispatchEvent( e );
		}
	}
}