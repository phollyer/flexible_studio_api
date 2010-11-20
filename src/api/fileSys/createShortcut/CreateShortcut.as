package api.fileSys.createShortcut
{
	import flash.events.IEventDispatcher;
	import api.fileSys.FileSys;

    [Event(name="complete", type="CreateShortcutEvent")]
    [Event(name="missingShotcutPath", type="CreateShortcutEvent")]
    [Event(name="missingSourcePath", type="CreateShortcutEvent")]
    [Event(name="createShortcutError", type="FileSysError")]
    [Bindable]
	public class CreateShortcut extends FileSys
	{
		// show
		public static const NORMAL:String = "Normal";
		public static const MAXIMIZED:String = "Maximized";
		public static const MINIMIZED:String = "Minimized";
		
		// Optional
		public var arguments:String = null;
		public var description:String = null;
		public var iconFile:String = null;
		public var iconIndex:int = 0;
		public var show:String = NORMAL;
		public var workDir:String = null;
		
		// Required
		public var shortcutFile:String = null;
		public var source:String = null;
		
		public function CreateShortcut(target:IEventDispatcher=null)
		{
			super(target);
		}
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