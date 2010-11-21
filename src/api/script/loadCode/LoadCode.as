package api.script.loadCode
{
	import api.events.script.loadCode.LoadCodeEvent;

	import api.script.Script;

	import flash.events.IEventDispatcher;

	/**
	* Dispatched if the Property <code>module</code> has not been supplied.
	*
	* @eventType api.events.SWFStudioEvent.MISSING_MODULE
	*/
	[Event(name="missingModule" , type="api.events.SWFStudioEvent")]
	/**
	* Dispatched when the Results are ready.
	*
	* @eventType api.events.script.loadCode.LoadCodeEvent.RESULT
	*/
	[Event(name="result", type="api.events.script.loadCode.LoadCodeEvent")]
	[Bindable]
	/**
	*
	*
	* @see http://www.northcode.com/v3/help/index.html?page=ssCore_Script_loadCode.html Northcode Help Documentation
	*/
	public class LoadCode extends Script
	{
		// Optional
		/**
		* 
		*
		* @defaultValue <code>null</code>
		*/
		public var path:String = null;
		/**
		* 
		*
		* @defaultValue <code>null</code>
		*/
		public var resource:String = null;
		
		// Required
		/**
		* 
		*
		* @defaultValue <code>null</code>
		*/
		public var module:String = null;
		
		// Result
		/**
		* 
		*
		* @defaultValue <code>null</code>
		*/
		public var scriptError:String = null;
		
		/**
		* Constructor for Script.LoadCode()
		*
		* @see http://www.northcode.com/v3/help/index.html?page=ssCore_Script_loadCode.html Northcode Help Documentation
		*/
		public function LoadCode(target:IEventDispatcher=null)
		{
			super(target);
		}
		/**
		*
		*
		*
		* @param moduleName
		*
		* @see http://www.northcode.com/v3/help/index.html?page=ssCore_Script_loadCode.html Northcode Help Documentation
		*/
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
		/**
		* A result has been received so dispatch it.
		*
		* @param r The result Object returned by SWF Studio.
		*
		* @private
		*/
		override protected function sendResult( r:Object ):void
		{
			scriptError = r.scriptError;
			
			var e : LoadCodeEvent = new LoadCodeEvent( LoadCodeEvent.RESULT );
			e.scriptError = scriptError;
			dispatchEvent( e );
		}
	}
}