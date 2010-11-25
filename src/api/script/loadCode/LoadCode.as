package api.script.loadCode
{
	import flash.events.IEventDispatcher;
	
	
	import api.events.script.loadCode.LoadCodeEvent;
	import api.script.Script;

	[Event(name="missingModule" , type="api.events.SWFStudioEvent")]
	[Event(name="result", type="api.events.script.loadCode.LoadCodeEvent")]
	[Bindable]
	public class LoadCode extends Script
	{
		// Optional
		public var path:String = null;
		public var resource:String = null;
		
		// Required
		public var module:String = null;
		
		// Result
		public var scriptError:String = null;
		
		public function LoadCode(target:IEventDispatcher=null)
		{
			super(target);
		}
		public function loadCode( moduleName:String = null ):void
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
					switch( path != null )
					{
						case true:
							__o.path = path;
					}
					switch( resource != null )
					{
						case true:
							__o.resource = resource;
					}
					ssCore.Script.loadCode( __o
										 ,{callback:actionComplete, errorSTR:"loadCodeError", code:"35004"} );
			}
		}
		override protected function sendResult( r:Object ):void
		{
			scriptError = r.scriptError;
			
			var e : LoadCodeEvent = new LoadCodeEvent( LoadCodeEvent.RESULT );
			e.scriptError = scriptError;
			dispatchEvent( e );
		}
	}
}