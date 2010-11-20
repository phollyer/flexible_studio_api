package api.fileSys.createShortcut
{
	import api.events.fileSys.createShortcut.CreateShortcutEvent;

	import api.fileSys.FileSys;

	import flash.events.IEventDispatcher;

    [Event(name="complete", type="CreateShortcutEvent")]
    [Event(name="missingShotcutPath", type="CreateShortcutEvent")]
    [Event(name="missingSourcePath", type="CreateShortcutEvent")]
    [Event(name="createShortcutError", type="FileSysError")]
    [Bindable]
	/**
	*
	*
	* @see http://www.northcode.com/v3/help/index.html?page=ssCore_FileSys_createShortcut.html Northcode Help Documentation
	*/
	public class CreateShortcut extends FileSys
	{
		// show
		public static const NORMAL:String = "Normal";
		public static const MAXIMIZED:String = "Maximized";
		public static const MINIMIZED:String = "Minimized";
		
		// Optional
		/**
		* 
		*
		* @defaultValue <code>null</code>
		*/
		public var arguments:String = null;
		/**
		* 
		*
		* @defaultValue <code>null</code>
		*/
		public var description:String = null;
		/**
		* 
		*
		* @defaultValue <code>null</code>
		*/
		public var iconFile:String = null;
		/**
		* 
		*
		* @defaultValue <code>0</code>
		*/
		public var iconIndex:int = 0;
		/**
		* 
		*
		* @defaultValue <code>NORMAL</code>
		*/
		public var show:String = NORMAL;
		/**
		* 
		*
		* @defaultValue <code>null</code>
		*/
		public var workDir:String = null;
		
		// Required
		/**
		* 
		*
		* @defaultValue <code>null</code>
		*/
		public var shortcutFile:String = null;
		/**
		* 
		*
		* @defaultValue <code>null</code>
		*/
		public var source:String = null;
		
		/**
		* Constructor for FileSys.CreateShortcut()
		*
		* @see http://www.northcode.com/v3/help/index.html?page=ssCore_FileSys_createShortcut.html Northcode Help Documentation
		*/
		public function CreateShortcut(target:IEventDispatcher=null)
		{
			super(target);
		}
		/**
		*
		*
		*
		* @param shortcutFilePath
		*
		* @param sourceSTR
		*
		* @see http://www.northcode.com/v3/help/index.html?page=ssCore_FileSys_createShortcut.html Northcode Help Documentation
		*/
		public function createShortcut( shortcutFilePath:String = null , sourceSTR:String = null ):void
		{
			shortcutFile = compareStrings( shortcutFilePath , shortcutFile );
			source = compareStrings( sourceSTR , source );
			
			switch( shortcutFile )
			{
				case null:
					missingShortcutFile();
					break;
				default:
					switch( source )
					{
						case null:
							missingSource();
							break;
						default:
							create();
					}
			}
		}
		private function create():void
		{
			var __o : Object = new Object();
			__o.shortcutFile = shortcutFile;
			__o.source = source;
			__o.iconIndex = iconIndex;
			__o.show = show;
			
			switch( arguments != null )
			{
				case true:
					__o.arguments = arguments;
			}
			switch( description != null )
			{
				case true:
					__o.description = description;
			}
			switch( iconFile != null )
			{
				case true:
					__o.iconFile = iconFile;
			}
			switch( workDir != null )
			{
				case true:
					__o.workDir = workDir;
			}
			
			ssCore.FileSys.createShortcut( __o
									,{callback:actionComplete, errorSTR:"createShortcutError", code:"9004"} );
		}

	}
}