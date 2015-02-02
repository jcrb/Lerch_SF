
# choix du moyen de contraception par les femmes
#'@param ar array correspondant aux différents choix possibles
#'@usage ar <- d[, 24:32]

choix <- function(ar, methode){
    
    for(i in 1:ncol(ar)){
        n <- nrow(ar)
        a <- prop.table(table(ar[, i], useNA = "ifany"))
        if(is.na(a[2]))
            a[1] <- 0
        x <- cbind(a[1])
        rownames(x) <- methode[i]
        
        if(i == 1)
            b <- x
        else
            b <- rbind(b, x)
        colnames(b) <- "%"
    }
    return(b)
}

# méthode plus simple:
#     x <- 0;for(i in 1:ncol(ar)){t <- mean(!is.na(ar[,i])); x <- x+ t; print(x)}
# 
# principe: on compte le nombre de lignes dont le contenu n'est pas égal à NA. 
# PB: pour le datafrme, le total n'est pas égal à 100% ?


# somme des colonnes
#'@param ar dataframe contenant le choix multiple
#'@param choix nom souhaité des colonne. Default = nom des colonnes du dataframe
#'@return un vecteur contenant le nombre de lignes de chaque colonnes différentes de NA
methode <- function(ar, choix = NULL){
    f <- function(x){sum(!is.na(x))} # x est un vecteur
    n <- nrow(ar)
    a <- apply(ar, 2, f)
    if(!is.null(choix)) names(a) <- choix
    # b <- rbind(a, a/sum(a))
    return (a)
}

# Somme des lignes
#'@param ar dataframe contenant le choix multiple
#'@param choix nom souhaité des colonne. Default = nom des colonnes du dataframe
#'@return un vecteur contenant le total de cellules différente de NA de chaque ligne 
methode2 <- function(ar, choix = NULL){
    f <- function(x){sum(!is.na(x))} # x est un vecteur
    n <- nrow(ar)
    a <- apply(ar, 1, f)
    if(!is.null(choix)) names(a) <- choix
    # b <- rbind(a, a/sum(a))
    return (a)
}

