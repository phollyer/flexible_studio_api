package api.script.create
{
	import api.events.script.create.CreateEvent;

	import api.script.Script;

	import flash.events.IEventDispatcher;

	/**
	* Dispatched if the Property <code>language</code> has not been supplied.
	*
	* @eventType api.events.SWFStudioEvent.MISSING_LANGUAGE
	*/
	[Event(name="missingLanguage" , type="api.events.SWFStudioEvent")]
	[Event(name="missingModule" , type="api.events.SWFStudioEvent")]
	[Bindable]
	/**
	*
	*
	* @see http://www.northcode.com/v3/help/index.html?page=ssCore_Script_create.html Northcode Help Documentation
	*/
	public class Create extends Script
	{
		public static const JSCRIPT:String = "jscript";
		public static const VBSCRIPT:String = "vbscript";
		
		// Required
		/**
		* 
		*
		* @defaultValue <code>null</code>
		*/
		public var language:String = null;
		/**
		* 
		*
		* @defaultValue <code>null</code>
		*/
		public var module:String = null;
		
		/**
		* Constructor for Script.Create()
		*
		* @see http://www.northcode.com/v3/help/index.html?page=ssCore_Script_create.html Northcode Help Documentation
		*/
		public function Create(target:IEventDispatcher=null)
		{
			super(target);
		}
		/**
		*
		*
		*
		* @param moduleName
		*
		* @param languageSTR
		*
		* @see http://www.northcode.com/v3/help/index.html?page=ssCore_Script_create.html Northcode Help Documentation
		*/
		public function create( moduleName:String = null , languageSTR:String = null ):void
		{
			module = compareStrings( moduleName , module );
			language = compareStrings( languageSTR , language );
			
			switch( module )
			{
				case null:
					missingModule();
					break;
				default:
					switch( language )
					{
						case null:
							missingLanguage();
							break;
						case JSCRIPT:
						case VBSCRIPT:
							ssCore.Script.create( {module:module , language:language}
												 ,{callback:actionComplete, errorSTR:"createError", code:"35002"} );
							break;
						default:
							invalidLanguage();
					}
			}
		}
		private function invalidLanguage():void
		{
			var e : CreateEvent = new CreateEvent( CreateEvent.RESULT_LANGUAGE );
			dispatchEvent( e );
		}

	}
}